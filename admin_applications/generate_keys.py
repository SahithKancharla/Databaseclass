import random
import string


def generate_random_key(length):
    characters = string.ascii_letters + string.digits
    key = "".join(random.choice(characters) for _ in range(length))
    return key


# Generate a random key string of length 10
def create_keys():
    random_key = []
    for i in range(10):
        random_key.append(generate_random_key(15))
    return random_key

# Open the file and write something to it
with open('keys.txt', "w") as file:
    print(create_keys())
    for key in create_keys():
        file.write(key + "\n")
