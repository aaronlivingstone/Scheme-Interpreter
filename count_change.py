
def count_change(total, max_coin, denoms = [50, 25, 10, 5, 1]):
    if total == 0:
        return 1
    if max_coin < 1 or total < 0 or len(denoms) == 0:
        return 0
    d = denoms[0]
    return count_change(total, (max_coin), denoms[1:]) + count_change(total-d, (max_coin-1), denoms)


def count_partitions(total, max_value):
    if total == 0:
        return 1
    if max_value == 0 or total < 0:
        return 0
    return count_partitions(total, max_value - 1) + count_partitions(total - max_value, max_value)

def list_partitions(total, max_pieces, max_value):
    part_list = []
    def find_parts(total, max_value, parts = tuple()):
        if len(parts) > max_pieces:
            return
        if total == 0:
            if parts not in part_list:
                part_list.append(parts)
        if max_value == 0 or total < 0:
            return 
        find_parts(total, max_value - 1, parts)
        find_parts(total - max_value, max_value, parts + (max_value,))
        return
    find_parts(total,max_value)
    return part_list












                 
