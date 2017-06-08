programmers = %{joe: "Erlang", jose: "Elixir", matz: "Ruby", rich: "Clojure"}

%{joe: "Erlang", jose: "Elixir", matz: "Ruby", rich: "Clojure"} = programmers
# A successful match
#  %{joe: "Erlang", jose: "Elixir", matz: "Ruby", rich: "Clojure"}

%{tolkien: "Elvish"} = programmers
# MatchError

# DESTRUCTURING
%{joe: a, jose: b, matz: c, rich: d} = %{joe: "Erlang", jose: "Elixir", matz: "Ruby", rich: "Clojure"}

a # "Erlang"
b # "Elixir"
c # "Ruby"
d # "Clojure"

# This also works for just grabbing one thing

%{jose: most_awesome_language} = %{joe: "Erlang", jose: "Elixir", matz: "Ruby", rich: "Clojure"}

most_awesome_language # "Elixir"

case Map.fetch(programmers, :rich) do
  {:ok, language} ->
    IO.puts "#{language} is a legit language"
  :error ->
    IO.puts "No idea what language this is"
end

case File.read("KISS - Beth.mp3") do
  {:ok, binary} ->
    IO.puts "KISS rocks!"
  {:error, reason} ->
    IO.puts "No Rock N Roll for anyone today because of #{reason}"
end
