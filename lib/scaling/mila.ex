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

  def handle_call({:offer_number, number}, from, state) do
    IO.puts "Получила число: #{number}"

    answer = cond do
      (number == state) -> :win
      true -> :lose
    end

    # GenServer.call(from, {:answer, answer})
    IO.puts "Ответ #{IO.inspect(answer)}, state: #{state}"

    GenServer.call({Lex, :"n1@127.0.0.1"}, {:answer, answer})

    {:reply, answer, state}
  end

  # Api
  def offer_number(number) do
    GenServer.call(__MODULE__, {:offer_number, number})
  end

  def secret_number do
    :rand.uniform(10)
  end
end
