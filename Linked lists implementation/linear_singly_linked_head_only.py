VALUE = 0
NEXT = 1


def add_to_back_1(value, head):
    item = [value, None]
    if head is None:
        head = item
    else:
        tail = head
        while tail[NEXT] is not None:
            tail = tail[NEXT]
        tail[NEXT] = item
    return head


def add_to_the_front(value, head):
    item = [value, head]
    head = item
    return head


def print_elements_one_by_one(head):
    if head is None:
        print('there are not any elements')
    else:
        print('elements: ', end='')
        while head is not None:
            print(head[VALUE], end=' ')
            head = head[NEXT]
        print()


def get_an_element_by_index(index, head):
    if isinstance(index, int) is False or index < 0:
        comment = 'index must be positive integer number'
        return comment
    current_index = 0
    while current_index < index and head is not None:
        head = head[NEXT]
        current_index += 1
    if head is None:
        comment = 'there is not this value'
    else:
        comment = 'element by index {} is: {}'.format(index, head[VALUE])
    return comment


def remove_an_element_from_the_end(head):
    if head is None or head[NEXT] is None:
        return None
    copy_of_pointer = head
    while head[NEXT][NEXT] is not None:
        head = head[NEXT]
    head[NEXT] = None
    return copy_of_pointer


def remove_an_element_from_the_front(head):
    if head is not None:
        head = head[NEXT]
    return head


def search_for_the_value(value, head):
    index = 0
    while head is not None and head[VALUE] != value:
        head = head[NEXT]
        index += 1
    if head is None:
        comment = 'there is no this value'
    else:
        comment = 'the index of value {} is: {}'.format(value, index)
    return comment


head = None

# head = add_to_back_1(1, head)
# head = add_to_back_1(['sd'], head)
# head = add_to_back_1('s', head)
# head = add_to_back_1(print, head)
# head = add_to_back_1(5, head)
# head = add_to_back_1(6, head)
print(head)

# head = add_to_the_front(1, head)
# head = add_to_the_front(2, head)
# head = add_to_the_front(3, head)
# head = add_to_the_front(4, head)
# head = add_to_the_front(5, head)
# head = add_to_the_front(6, head)
# print(head)

# head = remove_an_element_from_the_end(head)
# head = remove_an_element_from_the_end(head)
# head = remove_an_element_from_the_end(head)
# head = remove_an_element_from_the_end(head)
# head = remove_an_element_from_the_end(head)
# head = remove_an_element_from_the_end(head)
# head = remove_an_element_from_the_end(head)

# head = remove_an_element_from_the_front(head)
# head = remove_an_element_from_the_front(head)
# head = remove_an_element_from_the_front(head)
# head = remove_an_element_from_the_front(head)
# head = remove_an_element_from_the_front(head)
# head = remove_an_element_from_the_front(head)
# head = remove_an_element_from_the_front(head)
# print(head)

print_elements_one_by_one(head)

# print(get_an_element_by_index(3, head))
# print(get_an_element_by_index(-1, head))
# print(get_an_element_by_index('sd', head))

print(search_for_the_value(1, head))
# print(search_for_the_value(3, head))
# print(search_for_the_value(6, head))
# print(search_for_the_value("abrakadabra", head))
