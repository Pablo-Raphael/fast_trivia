# Fast Trivia - CheckMob

Olá, eu sou **Pablo Raphael** e este é o desafio do processo seletivo da **CheckMob**.
O projeto consiste em um MVP (Produto Mínimo Viável) de um aplicativo de questionários. Sendo possível nesta versão do desafio:
* Navegar entre as perguntas já respondidas e alterá-las livremente.
* Responder a vários questionários.
* Visualizar todas as perguntas já respondidas em todos os questionários.
* Refazer o mesmo questionário quantas vezes quiser.

### Métodologias e Skills utilizadas:
- Clean Architecture - Para melhor escalabilidade do projeto e desacoplamento entre as camadas de funcionamento.
- Gerenciamento de Estado MobX - Pela robustez e praticidade, julguei o MobX como opção mais adequada ao tamanho do projeto.
- Injeção de Dependências GetIt - Para fornecer a cada view as informações e objetos necessários.
### Sobre os packages:
- Flutter  3.10.6 (channel stable)
- Dart 3.0.6
### Observações
 - É muito importante que seja utilizada a versão mais recente do Fluter e versão do Dart acima da 3.0. Para isso use no seu terminal o comando `flutter upgrade`.
- Caso tenha problemas com algo não esqueça de executar o `flutter clean`.
- Não se esqueça que o MobX precisa de seus arquivos auto-gerados. Para garantir um bom funcionamento execute `flutter packages pub run build_runner build` após obter as dependências do pubspec.yaml.
- Este README e o código do projeto estão comentados em português exclusivamente para melhor compreensão dos avaliadores. Porém as variáveis e keywords continuam seguindo o padrão internacional.
### Desafios relevantes a considerar:
- O curto período de tempo foi sem dúvida a maior limitação para a criação do projeto. Apesar disso, foi possível em 3 dias, criar uma versão usável que atende a todos os requisitos e um pouco mais.
- Com mais alguns dias seria possível a aplicação de testes robustos, aplicação de psicologia ao design. melhor documentação, alternância entre temas, icones, animações e muito mais. Porém, ainda assim vejo essa como uma versão de excelência. Sendo feito da melhor forma diante das condições.
### Screenshots:
![Screenshot da tela inicial](https://github.com/Pablo-Raphael/fast_trivia/blob/main/screenshots/Captura%20de%20tela%202023-08-22%20064446.png?raw=true)
# -
![Screenshot questionário](https://github.com/Pablo-Raphael/fast_trivia/blob/main/screenshots/Captura%20de%20tela%202023-08-22%20064518.png?raw=true)
# -
![Screenshot gabarito](https://github.com/Pablo-Raphael/fast_trivia/blob/main/screenshots/Captura%20de%20tela%202023-08-22%20064502.png?raw=true)
# -
![Screenshot questionário incompleto](https://github.com/Pablo-Raphael/fast_trivia/assets/73996659/240ee1c4-f34a-4d02-8198-a5dd89da0667)
# -
![Screenshot da tela de respostas](https://github.com/Pablo-Raphael/fast_trivia/blob/main/screenshots/Captura%20de%20tela%202023-08-22%20064202.png?raw=true)
