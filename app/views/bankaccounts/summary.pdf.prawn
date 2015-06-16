image "#{Rails.root}/app/assets/images/logo-circularisation.png", :width => 270, :height => 30

bounding_box([0, 660], :width => 200, :height => 75) do
  transparent(0) {stroke_bounds}
  
text "Circularisation.com"
text "5 rue Néricault Destouches"
text "37000"
text "Tours"

end

text "Adresse email de contact", :size =>12, :style => :bold
text "Email : #{@user.email}"

bounding_box([300, 585], :width => 200, :height => 50) do
  transparent(0) {stroke_bounds}

text "Vos informations", :size =>12, :style => :bold
text "#{@user.name}"

end

move_down 10
text "Information client", :size =>12, :style => :bold
text "#{@client.name}"
text "#{@client.number_and_street}"
text "#{@client.zip_code}"
text "#{@client.city}"

bounding_box([300, 525], :width => 200, :height => 50) do
  transparent(0) {stroke_bounds}
text "Signataire autorisé :", :size=>12, :style => :bold
text "#{@clientcontact.email}"
end
move_down 25
stroke_horizontal_rule
move_down 20
text "Information sur la circularisation", :size=>12, :style=>:bold

text "Banque"
text "Numéro de compte"
text "Devise" 
 text "Solde"

bounding_box([120, 405], :width => 200, :height => 60) do
  transparent(0) {stroke_bounds}
text "#{@bank.name}"
text "#{@bankaccount.number}"
text "#{@bankaccount.currency}"
text "#{@bankaccount.balance}"
end

move_down 10
text "Résultat :", :size=>14, :style=>:bold
bounding_box([120, 335], :width => 300, :height => 20) do
  transparent(0) {stroke_bounds}
text "Montant confirmé par la banque", :size=>14, :style=>:bold
end
move_down 10
stroke_horizontal_rule
move_down 10
text "Suivi d'activité", :size=>12, :style=>:bold
move_down 5

table([["Description","Email","Date et Heure"],["Signature","#{@clientcontact.email}","#{@bankaccount.signed}"],["Envoi","#{@user.email}","#{@bankaccount.issued}"],["Réponse","#{@bankcontact.email}","#{@bankaccount.answered}"]], :row_colors => ["ffffff","d2c6c6"])
move_down 12
stroke_horizontal_rule
move_down 10
text "Service Clients", :size=>12, :style=>:bold
text "Pour toute question concernant cette circularisation, contactez le Service Clients.", :size=>11
text "Téléphone :", :size=>11
text "Email :", :size=>11
text "Courrier :", :size=>11
bounding_box([120, 130], :width => 400, :height => 50) do
  transparent(0) {stroke_bounds}
text "+33 (0) 7 87 34 36 33 : Coût d'une communication locale", :size=>11
text "service.clients@circularisation.com", :size=>11
text "Circularisation.com 5 rue Néricault Destouches 37000 Tours", :size=>11
end
stroke_horizontal_rule
move_down 5
text "Circularisation électronique traitéep ar Circularisation.com - Siège social : 5 rue Néricault Destouches 37000 Tours - B 421 938 861 RCS Tours", :size=>10, :position=>:center

