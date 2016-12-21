FROM elixir:1.3.3
RUN mix local.hex --force
WORKDIR /app
ADD . /app
RUN mix deps.get
RUN mix compile
RUN elixir --name n1@127.0.0.1 --erl "-config sys.config" -S mix run
