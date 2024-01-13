require "./spec/spec_helper"

RSpec.describe StatTracker do
    it 'exists' do
        game_path = './data/games.csv'
        team_path = './data/teams.csv'
        game_teams_path = './data/game_teams.csv'

        locations = {
        games: game_path,
        teams: team_path,
        game_teams: game_teams_path
        }

        stat_tracker = StatTracker.new(locations)
        expect(stat_tracker).to be_an_instance_of(StatTracker)
    end

    # it 'can create objects' do
        #code
    # end
    # describe '#highest_total_score'
    #     it 'returns the highest total score' do
    #         game_path = './spec/fixtures/games_fixture.csv'
    #         #this is looking at the original teams.csv file rn
    #         team_path = './data/teams.csv'
    #         game_teams_path = './spec/fixtures/game_teams_fixture.csv'

    #         locations = {
    #         games: game_path,
    #         teams: team_path,
    #         game_teams: game_teams_path
    #         }

    #         stat_tracker = StatTracker.new#(locations)
    #         expect(stat_tracker.highest_total_score).to eq(5)
    #     end
    # end

    describe '#percentage_home_wins' do
        it 'returns the percentage of home wins' do
            game_path = './spec/fixtures/games_fixture.csv'
            team_path = './data/teams.csv'
            game_teams_path = './spec/fixtures/game_teams_fixture.csv'

            locations = {
                games: game_path,
                teams: team_path,
                game_teams: game_teams_path
            }

            stat_tracker = StatTracker.new(locations)

            expect(stat_tracker.percentage_home_wins).to eq(0.5)

        end
    end

    describe '#percentage_visitor_wins' do
        it 'returns the percentage of visitor wins' do
            game_path = './spec/fixtures/games_fixture.csv'
            team_path = './data/teams.csv'
            game_teams_path = './spec/fixtures/game_teams_fixture.csv'

            locations = {
                games: game_path,
                teams: team_path,
                game_teams: game_teams_path
            }

            stat_tracker = StatTracker.new(locations)

            expect(stat_tracker.percentage_visitor_wins).to eq(0.4)

        end
    end

    describe '#percentage_ties' do
        it 'returns the percentage of ties' do
            game_path = './spec/fixtures/games_fixture.csv'
            team_path = './data/teams.csv'
            game_teams_path = './spec/fixtures/game_teams_fixture.csv'

            locations = {
                games: game_path,
                teams: team_path,
                game_teams: game_teams_path
            }

            stat_tracker = StatTracker.new(locations)

            expect(stat_tracker.percentage_ties).to eq(0.1)

        end
    end

    describe 'count_of_games_by_season' do
        it 'returns the count of games by season' do

            game_path = './spec/fixtures/games_fixture.csv'
            locations = {
                games: game_path
            }

            stat_tracker = StatTracker.new(locations)

            expect(stat_tracker.count_of_games_by_season).to eq({})
        end
    end

end
