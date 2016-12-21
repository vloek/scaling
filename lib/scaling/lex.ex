defmodule Lex do
  @moduledoc """
  Игрок
  """

  use GenServer

  def start_link(master), do: GenServer.start_link(__MODULE__, master, name: __MODULE__)

  def init(master) do
    {:ok, master}
  end

  def handle_call({:answer, answer}, from, state) do
    IO.puts "Кастуююююю вопрос"

    case answer do
      :win -> IO.puts "Заебись, я выйграл"
      :lose -> IO.puts "Вот говно.."; retry_answer(from)
    end

    {:reply, nil, state}
  end

  # Api

  def retry_answer(master) do
    :timer.sleep(1000)

    GenServer.call({Mila, :"n2@127.0.0.1"}, {:offer_number, prob_num})
  end

  defp prob_num do
    :rand.uniform(10)
  end
end
