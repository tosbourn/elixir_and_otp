defmodule Metex.Worker do
  def loop do
    receive do
      {sender_pid, location} -> send(sender_pid, {:ok, temperature_of(location)})
      _ -> IO.puts "Don't know how to process this message"
    end
    loop()
  end

  def temperature_of(location) do
    result = location
      |> url_for
      |> HTTPoison.get
      |> parse_response

    case result do
      {:ok, temp} -> "#{location}: #{temp}C"
      :error -> "#{location} not found"
    end
  end

  defp url_for(location) do
    location = URI.encode(location)

    "http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{apikey()}"
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body
      |> JSON.decode!
      |> compute_temperature
  end

  defp parse_response(_), do: :error

  defp compute_temperature(json) do
    try do
      temp = (json["main"]["temp"] - 273.15) |> Float.round(1)
      {:ok, temp}
    rescue
      _ -> :error
    end
  end

  defp apikey do
    "7ecec6f6626e543d3f80f86ef021ad21"
  end
end

# cities = ["Singapore", "Monaco", "Belfast", "London"]
# cities |> Enum.each(fn city ->
#   pid = spawn(Metex.Worker, :loop, [])
#   send(pid, {self, city})
# end)
