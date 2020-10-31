get_letter_index <- function(username){

  if(str_count(username) > 1){
    return("Enter single character")
  }else{

    tibble(one = LETTERS,
           two = 1:26) -> example_tibble

    return(example_tibble %>%
             filter(one == toupper(username)) %>%
             pull(two))
  }

}
