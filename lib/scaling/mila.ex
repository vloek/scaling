defmodule Mila do
  @moduledoc """
  Загадывает число и говрит победа/поражение
  """

  use GenServer

  def start_link, do: GenServer.start_link(__MODULE__, nil, name: __MODULE__)

  @doc """
  Генерация начального secret_number
  """
  def init(_args) do
    IO.puts "Сохранила число"
    {:ok, secret_number}
  end

  def handle_cast({:offer_number, number}, state) do
    answer = cond do
      (number == state) -> IO.puts "Mila: ты выйграл)"; :win
      true -> IO.puts "Mila: не получилось, попробуй еще"; :lose
    end

    GenServer.cast({Lex, :"n1@127.0.0.1"}, {:answer, answer})

    {:noreply, state}
  end

  # Api
  def offer_number(number) do
    GenServer.cast(__MODULE__, {:offer_number, number})
  end

  def secret_number do
    :rand.uniform(10)
  end
end
