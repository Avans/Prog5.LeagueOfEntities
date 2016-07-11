using GalaSoft.MvvmLight;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LeagueOfEntities.Domain;

namespace LeagueOfEntity.ViewModel
{
    public class CompetitionViewModel : ViewModelBase
    {
        private Competition _competition;

        public CompetitionViewModel()
        {
            _competition = new Competition();
        }

        public CompetitionViewModel(Competition pCompetition)
        {
            this._competition = pCompetition;
        }

        public string Name {
            get { return _competition.Name;  }
        }

        public DateTime Date
        {
            get { return _competition.Date; }
        }

        public string TeamA
        {
            get
            {
                if (_competition.Teams.Count() > 0)
                    return _competition.Teams.ElementAt(0).Name;
                else
                {
                    return null;
                }
            }
        }

        public string TeamB
        {
            get
            {
                if (_competition.Teams.Count() > 1)
                    return _competition.Teams.ElementAt(1).Name;
                else
                {
                    return null;
                }
            }
        }
    }
}
