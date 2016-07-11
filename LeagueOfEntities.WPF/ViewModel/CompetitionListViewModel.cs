using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using System.Collections.ObjectModel;
using System.Windows.Input;
using LeagueOfEntities.Domain;
using System.Linq;
using System;


namespace LeagueOfEntity.ViewModel
{
    /// <summary>
    /// This class contains properties that the main View can data bind to.
    /// <para>
    /// Use the <strong>mvvminpc</strong> snippet to add bindable properties to this ViewModel.
    /// </para>
    /// <para>
    /// You can also use Blend to data bind with the tool's support.
    /// </para>
    /// <para>
    /// See http://www.galasoft.ch/mvvm
    /// </para>
    /// </summary>
    public class CompetitionListViewModel : ViewModelBase
    {
        public CompetitionViewModel SelectedCompetition { get; set; }

        public ObservableCollection<CompetitionViewModel> Competitions { get; set; }

        public ICommand SelectCompetitionCommand { get; set; }

        public CompetitionListViewModel()
        {
            using(var context = new DatabaseContext())
            {
                var compList = context.Competitions
                    .Include("Teams")
                    .OrderByDescending(c => c.Date)
                    .ToList();
                var compVmList = compList.Select(c => new CompetitionViewModel(c));
                Competitions = new ObservableCollection<CompetitionViewModel>(compVmList);
            }



            SelectCompetitionCommand = new RelayCommand<CompetitionViewModel>(SelectCompetition);
        }

        private void SelectCompetition(CompetitionViewModel parameter)
        {
            SelectedCompetition = parameter;
            RaisePropertyChanged("SelectedCompetition");
        }



    }
}