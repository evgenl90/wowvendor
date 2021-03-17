window.addEventListener('load', function(){

    async function send(rockPosition, raceTime, jumpDistance, rockSize, isWin){
        let data = new FormData();
        data.append('rock_position', rockPosition);
        data.append('race_time', raceTime);
        data.append('jump_distance', jumpDistance);
        data.append('rock_size', rockSize);
        data.append('is_win', isWin);

        try{
            var response = await fetch("../php/handler.php", {method: "post",body: data});
            if(response.status === 200){
                var res = await response.json();
                if('error' in res){
                    alert(res['error']);
                } else if('success' in res){
                    alert(res['success']);
                }
                return false;
            }
            alert("Нет доступа страницы или страницы не существует!");
        }catch(err){
            console.log(err);
        }

    }

    var  start = 0;

    function watchChangeObject(){

        window.character.run();

        if(start === 0){
            start = new Date().getTime();
        }


        var characterPosition = window.character.characterPosition,
            isRunning = window.character.isRunning,
            rockPosition = window.terrain.rockPosition,
            jumpDistance = window.terrain.rockPosition - window.terrain.rockSize*2,
            rockSize = window.terrain.rockSize,
            isWin = window.character.isWin;



        Object.defineProperties(window.character, {
            isWin: {
                get(){
                    return isWin;
                },
                set(value) {
                    isWin = value;
                    let end = new Date().getTime();
                    let dateTime = (end - start)/1000;
                    //console.log('Время удачного забега',dateTime);
                    start = 0;
                    send(rockPosition, dateTime, jumpDistance, rockSize, 1);
                }
            },
            characterPosition: {
                get(){
                    return characterPosition;
                },
                set(value) {
                    characterPosition = value;

                    if(value >= (jumpDistance) && value < rockPosition){

                      this.jump();
                    }

                }

            },
            isRunning: {
                get: function(){
                    return isRunning;
                },
                set: function(value){
                    isRunning = value;
                    if(value === false){
                        if(this.isJumping !== false){
                            let end = new Date().getTime();
                            let dateTime = (end - start)/1000;
                            //console.log('Время неудачного забега',dateTime);
                            start = 0;
                            send(rockPosition, dateTime, jumpDistance, rockSize, 0);
                        }else{
                          if(characterPosition !== 1020){
                              //console.log('Просто остановка');
                          }
                        }

                    }

                }
            }
        });


    }
    watchChangeObject();




    document.addEventListener('keydown', function(event) {
        if (event.code == 'KeyD') {
            watchChangeObject();
        }
    });




});
