using System.IO;
using System.Windows;
using DotnetQuiz.Data;
using DotnetQuiz.Services;
using DotnetQuiz.ViewModels;

namespace DotnetQuiz;

public partial class App : Application
{
    protected override void OnStartup(StartupEventArgs e)
    {
        base.OnStartup(e);

        var connectionFactory = new SqliteConnectionFactory();
        DatabaseInitializer.Initialize(connectionFactory);

        var dataDir = Path.Combine(AppContext.BaseDirectory, "Data");
        foreach (var seedFile in new[] { "seed_hard_questions.sql" })
        {
            QuestionSeeder.SeedFromSqlFile(connectionFactory, Path.Combine(dataDir, seedFile));
        }

        IQuestionRepository questionRepository = new QuestionRepository(connectionFactory);
        var mainViewModel = new MainViewModel(questionRepository);

        var mainWindow = new MainWindow
        {
            DataContext = mainViewModel
        };
        mainWindow.Show();
    }
}
