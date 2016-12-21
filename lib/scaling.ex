defmodule Scaling do
  use GenServer

  ### GenServer API

  @doc """
  Функция обратного вызова для GenServer.init/1
  """
  def init(state), do: {:ok, state}

  @doc """
  Функции обратного вызова для GenServer.handle_call/3
  """
  def handle_call({:hello, name}, from, state) do
    IO.puts "Hello, #{name}"
    {:reply, secret_number, state}
  end

  ### Клиентский API

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def hello(name), do: GenServer.call(__MODULE__, {:hello, name})

  defp secret_number do
    100
  end
end
