defmodule Lex do
  @moduledoc """
  Игрок
  """

  use GenServer

  def start_link(master), do: GenServer.start_link(__MODULE__, master, name: __MODULE__)

  def init(master) do
    {:ok, master}
  end

  def handle_cast({:answer, answer}, state) do
    case answer do
      :win -> IO.puts "Lex: Уиии!"
      :lose ->
        IO.puts "Lex: Ну вот.."
        retry_answer({Mila, :"n2@127.0.0.1"})
    end

    {:noreply, state}
  end

  # Api

  def retry_answer(master) do
    number = prob_num
    :ok = GenServer.cast({Mila, :"n2@127.0.0.1"}, {:offer_number, number})
    IO.puts "Lex: мое число #{prob_num}"
  end

  defp prob_num do
    :rand.uniform(10)
  end
end
