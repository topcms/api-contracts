# api-contracts（方案2：单仓分目录）

## 目录约定

- `api/`：仅存放 proto 协议定义；
- `gen/go/`：仅存放 Go 生成代码（pb、grpc、http）；
- `gen/java/`：预留 Java 生成代码目录；
- 根目录保留 `buf.yaml`、`buf.gen.yaml`、`buf.lock`、`go.mod`。

## 常用命令

- 更新依赖：`buf dep update`
- 协议校验：`buf lint`
- 破坏性检查：`buf breaking --against '.git#branch=main'`
- 生成 Go：`buf generate`

## Go 服务引用方式

服务通过 Go module 版本化依赖本仓库，引用生成包：

- `github.com/topcms/api-contracts/gen/go/api/common/v1`
- `github.com/topcms/api-contracts/gen/go/api/user/v1`
- `github.com/topcms/api-contracts/gen/go/api/order/v1`
- `github.com/topcms/api-contracts/gen/go/api/payment/v1`

## 变更流程

1. 修改 `api/` 下 proto；
2. 运行 `buf lint` + `buf generate`；
3. 提交 proto 与 `gen/go`；
4. 合并后打 tag；
5. 各业务服务按需升级依赖版本。

