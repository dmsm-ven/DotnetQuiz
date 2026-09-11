using System.Globalization;
using System.Windows;
using System.Windows.Data;

namespace DotnetQuiz.Converters;

/// <summary>true -> Collapsed, false -> Visible. Используется для скрытия контента, пока идёт загрузка.</summary>
public class InverseBooleanToVisibilityConverter : IValueConverter
{
    public object Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
        => value is bool isTrue && isTrue ? Visibility.Collapsed : Visibility.Visible;

    public object ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
        => throw new NotSupportedException();
}
