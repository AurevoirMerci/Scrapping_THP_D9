# Scrapping_THP_D9

Hello <3 
Bienvenue sur le tuto scraping! 


1. exercice sur la crypto 

Nous avons créés toutes les arrays dans lesquelles nous allons stocker ce que nous avons scrapé. Puis nous avons les deux blocs pour scraper le site de coinmarket. Enfin les trois dernières lignes rassemblent les données des deux arrays en une seule array avec des hash qui incluent une donnée de chaque array à chaque fois.

2. exercice sur les mails des mairies

Dans la première méthode, nous scrapons une partie du lien de l'annuaire des mairies et nous mettons le [1..-1] pour enlever le point au début de l'expression prise. Puis dans la deuxième méthode, nous sélectionons dans la deuième page à la fois la ville et l'email de la mairie en question, que nous incluons directement dans un hash pour chaque mairie. Puis nous appelons la deuxième méthode dans la première, ce qui la fait marcher automatiquement.

3. exercice sur les mails des députés

Nous avons utilisé 3 méthodes pour celui-ci = une pour le scrapping name, une pour les emails, et une pour faire le lien. Pour le next page, utilisation d'une variable i qui correspond à l'url de chaque page qui augmente de 50 à la page suivante. Résultat obtenu au bon format : array qui contient une multitude de hash. Seul problème, le nombre de députés scrapé correspond au vrai nombre de députés alors que le nombre d'emails scrapé ne correspond pas.
