/// array_sum(array)
/// Returns the sum of all elements in the array.
/// Arguments:
///   - array: The array to calculate the sum for.
/// Returns:
///   The sum of all elements in the array.
function array_sum(_array) {
    var _sum = 0;
    var _len = array_length(_array);

    for (var _i = 0; _i < _len; _i++) {
        _sum += _array[_i];
    }

    return _sum;
}