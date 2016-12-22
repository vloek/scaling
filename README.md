# Scaling

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `scaling` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:scaling, "~> 0.1.0"}]
    end
    ```

  2. Ensure `scaling` is started before your application:

    ```elixir
    def application do
      [applications: [:scaling]]
    end
    ```
## Run
  n1@host$ iex --name n1@127.0.0.1 --erl "-config sys.config" -S mix
  n2@host$ iex --name n2@127.0.0.1 --erl "-config sys.config" -S mix
