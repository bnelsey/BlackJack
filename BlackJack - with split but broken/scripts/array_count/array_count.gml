/// array_count(array, value)
/// Returns the number of occurrences of the specified value in the array.
/// Arguments:
///   - array: The array to search.
///   - value: The value to count.
/// Returns:
///   The count of occurrences of the specified value in the array.
function array_count(_array, _value) {
    var _count = 0;
    var _len = array_length(_array);

    for (var _i = 0; _i < _len; _i++) {
        if (_array[_i] == _value) {
            _count++;
        }
    }

    return _count;
}