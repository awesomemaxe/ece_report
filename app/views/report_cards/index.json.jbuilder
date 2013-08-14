json.array!(@report_cards) do |report_card|
  json.extract! report_card, :UID
  json.url report_card_url(report_card, format: :json)
end
