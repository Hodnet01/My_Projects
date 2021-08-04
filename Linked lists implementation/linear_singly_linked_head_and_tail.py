VALUE = 0
NEXT = 1
PREV = 2


def add_to_back_2(value, head, tail):  #1
    item = [value, None]
    if head is None:
        head = item
    else:
        tail[NEXT] = item
    tail = item
    return head, tail


def add_to_the_front(value, head, tail):  #2
    item = [value, None]
    if head is None:
        head = tail = item
    else:
        item[NEXT] = head
        head = item
    return head, tail


def print_elements_one_by_one(head):  #3
    while head:
        print(head[VALUE], end=' ')
        head = head[NEXT]


def get_an_element_by_index(index, head):  #4
    i = 0
    while i < index and head:
        head = head[NEXT]
        i += 1
    if head is None or index < 0:
        return None
    else:
        return head[VALUE]


def remove_an_element_from_the_end(head, tail):  #5
    if head and head[NEXT]:
        true_head = head
        while head[NEXT][NEXT]:
            head = head[NEXT]
        head[NEXT] = None
        tail = head
        return true_head, tail
    else:
        return None, None


def remove_an_element_from_the_front(head, tail): #6
    if head and head[NEXT]:
        head = head[NEXT]
        tail = head
        while tail[NEXT]:
            tail = tail[NEXT]
        return head, tail
    else:
        return None, None


def search_for_the_value(value, head):  #7
    i = 0
    while head and head[VALUE] != value:
        head = head[NEXT]
        i += 1
    if head is None:
        return None
    else:
        return i


head = tail = None
head, tail = add_to_back_2(10, head, tail)
head, tail = add_to_back_2(20, head, tail)
head, tail = add_to_back_2(30, head, tail)

# head, tail = add_to_the_front(10, head, tail)
# head, tail = add_to_the_front(20, head, tail)
# head, tail = add_to_the_front(30, head, tail)

# print_elements_one_by_one(head)
# print(get_an_element_by_index(2, head))
# head, tail = remove_an_element_from_the_end(head, tail)
# head, tail = remove_an_element_from_the_front(head, tail)
# print(search_for_the_value(20, head))
print(head, tail)
