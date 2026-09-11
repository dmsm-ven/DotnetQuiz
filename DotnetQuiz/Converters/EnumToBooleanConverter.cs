using System.Globalization;
using System.Windows.Data;
using DotnetQuiz.Models;

namespace DotnetQuiz.Converters;

/// <summary>Позволяет привязать RadioButton.IsChecked к значению enum Difficulty.</summary>
public class EnumToBooleanConverter : IValueConverter
{
    public object Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        if (value == null || parameter == null) return false;
        return value.ToString() == parameter.ToString();
    }

    public object ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        if (value is bool isChecked && isChecked && parameter != null)
        {
            return Enum.Parse(typeof(Difficulty), parameter.ToString()!);
        }
        return Binding.DoNothing;
    }
}
