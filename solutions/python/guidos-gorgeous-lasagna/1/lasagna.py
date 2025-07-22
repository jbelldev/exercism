"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""


PREPARATION_TIME   = 2
EXPECTED_BAKE_TIME = 40


def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    result = EXPECTED_BAKE_TIME - elapsed_bake_time
    return result


def preparation_time_in_minutes(number_of_layers):
    """Calculate how much time is needed to prepare based on the number of layers.

    :param number_of_layers: int - how many layers in use.
    :return: int - total preparation time in minutes derived from 'PREPARATION_TIME'.
    """

    result = PREPARATION_TIME * number_of_layers
    return result


def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """Calculate total elapsed time of lasagna (including preparation and baking)

    :param number_of_layers: int - how many layers in use.
    :param elapsed_bake_time: int - how much time has elapsed since baking started (in minutes).

    :return: int - total time (in minutes) since bake started.
    """

    result = elapsed_bake_time + (number_of_layers * PREPARATION_TIME)
    return result
