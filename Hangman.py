import random
import requests

# Choose one random word from the API list
def get_word():
    words = fetch_words()
    if words:
        return random.choice(words)
    else:
        return "default"  #Emergency word if nothing works
    
# Finds a word from the API list
def fetch_words():
    api_url = 'https://random-word-api.vercel.app/api?words=10'
    try:
        response = requests.get(api_url)
        if response.status_code == 200:
            words = response.json()
            return words
        else:
            print(f"Failed to fetch words: {response.status_code}")
            return []
    except requests.RequestException as e:
        print(f"An error occurred: {e}")
        return []

# Add spaces between letters
def add_spaces(word):
    word_with_spaces = " ".join(word)
    return word_with_spaces

# Draw the display
def draw_screen(num_wrong, num_guesses, guessed_letters, displayed_word):
    print("-" * 79)
    print("Word:", add_spaces(displayed_word),
          "  Guesses:", num_guesses,
          "  Wrong:", num_wrong,
          "  Tried:", add_spaces(guessed_letters))
    draw_hangman(num_wrong) #CORRECTION: call this function to pass num_wrong down
    
#Draw hangman for each wrong number
def draw_hangman(num_wrong):
    if num_wrong == 1:
        print("------")
        print("     |")
        print("     O")
    elif num_wrong == 2:
        print("------")
        print("     |")
        print("     O")
        print("     |")
    elif num_wrong == 3:
        print("------")
        print("     |")
        print("     O")
        print("    \|")
    elif num_wrong == 4:
        print("------")
        print("     |")
        print("     O")
        print("    \|/")
    elif num_wrong == 5:
        print("------")
        print("     |")
        print("     O")
        print("    \|/")
        print("     |")
    elif num_wrong == 6:
        print("------")
        print("     |")
        print("     O")
        print("    \|/")
        print("     |")
        print("    /")
    elif num_wrong == 7:
        print("------")
        print("     |")
        print("     O")
        print("    \|/")
        print("     |")
        print("    /\ ")

# Get next letter from user
def get_letter(guessed_letters):
    while True:
        guess = input("Enter a letter: ").strip()
    
        # Make sure the user enters a letter and only one letter
        if guess == "" or len(guess) > 1:
            print("Invalid entry. " +
                  "Please enter one and only one letter.")
            continue
        # Don't let the user try the same letter more than once
        elif guess in guessed_letters:
            print("You already tried that letter.")
            continue
        else:
            return guess

def main(): #NEW: Interegated play_game function so main function can directly call draw_hangman
    print("Play the H A N G M A N game")
    while True:
        word = get_word()
   
        word_length = len(word)
        remaining_letters = word_length
        displayed_word = "_" * word_length

        num_wrong = 0               
        num_guesses = 0
        guessed_letters = ""
        
        draw_screen(num_wrong, guessed_letters, guessed_letters, displayed_word)
        
        while num_wrong < 7 and remaining_letters > 0:
            guess = get_letter(guessed_letters)
            guessed_letters += guess
            pos = word.find(guess, 0)
            if pos != -1:
                displayed_word = ""
                remaining_letters = word_length
                for char in word:
                    if char in guessed_letters:
                        displayed_word += char
                        remaining_letters -= 1
                    else:
                        displayed_word += "_"
            else:
                num_wrong += 1
                draw_hangman(num_wrong)  # Call draw_hangman function to draw the hangman
            draw_screen(num_wrong, len(guessed_letters), guessed_letters, displayed_word)
            
        print("-" * 79)
        if remaining_letters == 0:
            print("Congratulations! You got it in", len(guessed_letters), "guesses.")
        else:
            print("Sorry, you lost.")
            print("The word was:", word)
            print()
            again = input("Do you want to play again (y/n)?: ").lower()
        
        if again != "y":
            break

if __name__ == "__main__":
    main()

