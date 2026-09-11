using System.Globalization;
using System.Windows.Data;

namespace DotnetQuiz.Converters;

/// <summary>Позволяет привязать RadioButton.IsChecked к индексу выбранного варианта ответа (int?).</summary>
public class IndexToBooleanConverter : IValueConverter
{
    public object Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        if (value is int index && parameter != null)
        {
            return index == System.Convert.ToInt32(parameter);
        }
        return false;
    }

    public object ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        if (value is bool isChecked && isChecked && parameter != null)
        {
            return System.Convert.ToInt32(parameter);
        }
        return Binding.DoNothing;
    }
}
