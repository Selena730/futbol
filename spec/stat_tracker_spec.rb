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

    describe '#game stats' do
        describe '#total_scores' do
            it 'returns the highest total score' do
                game_path = './spec/fixtures/games_fixture.csv'
                #this is looking at the original teams.csv file rn
                team_path = './data/teams.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.highest_total_score).to eq(7)
                expect(stat_tracker.lowest_total_score).to eq(2)
            end

            it 'returns the lowest total score' do
                game_path = './spec/fixtures/games_fixture.csv'
                #this is looking at the original teams.csv file rn
                team_path = './data/teams.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.lowest_total_score).to eq(2)
            end
        end

        describe '#percentage_home_wins' do
            it 'returns the percentage of home wins' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './spec/fixtures/teams_fixture.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)

                expect(stat_tracker.percentage_home_wins).to eq(0.5)
            end
        end

        describe '#percentage_visitor_wins' do
            it 'returns the percentage of visitor wins' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './spec/fixtures/teams_fixture.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)

                expect(stat_tracker.percentage_visitor_wins).to eq(0.4)
            end
        end

        describe '#percentage_ties' do
            it 'returns the percentage of ties' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './spec/fixtures/teams_fixture.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)

                expect(stat_tracker.percentage_ties).to eq(0.1)
            end
        end
      
        describe '#count of games by season' do
            it 'returns the amount of games per season' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './spec/fixtures/teams_fixture.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)

                expect(stat_tracker.count_of_games_by_season).to eq({"20122013"=>9, "20132014"=>11})
            end
        end

        describe '#average goals' do
            it 'returns average goals for all seasons' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './spec/fixtures/teams_fixture.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.average_goals_per_game).to eq(4.45)
            end

            it 'returns average goals per season' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './spec/fixtures/teams_fixture.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }
                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.average_goals_per_season).to eq({"20122013" => 4.56, "20132014" => 4.36})
            end
        end
    end

    describe '#league statistics' do
        describe '#count of teams' do
            it 'returns average goals per season' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './spec/fixtures/teams_fixture.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.count_of_teams).to eq(32)
            end
        end
      
        describe '#best_offense' do
            it 'returns the team with the best offense' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './spec/fixtures/teams_fixture.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.best_offense).to eq("FC Dallas")
            end
        end


        describe '#worst_offense' do
            it 'returns the team with the worst offense' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './spec/fixtures/teams_fixture.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.worst_offense).to eq("Sporting Kansas City")
            end
        end
  
        describe '#highest and lowest scoring visitor and home team' do
            it 'returns highest scoring visitor' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './data/teams.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.highest_scoring_visitor).to eq("FC Dallas")
            end

            it 'returns highest scoring home team' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './data/teams.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.highest_scoring_home_team).to eq("FC Dallas")
            end

            it 'returns lowest scoring visitor' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './data/teams.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.lowest_scoring_visitor).to eq("Houston Dynamo")
            end

            it 'returns lowest scoring home team' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './data/teams.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.lowest_scoring_home_team).to eq("Sporting Kansas City")
            end
        end
    end
  
    describe '#season statistics' do
        describe '#season coach stats' do
            it 'returns winningest_coach' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './spec/fixtures/teams_fixture.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.winningest_coach("20122013")).to eq("Claude Julien")
            end

            it 'returns worst_coach' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './spec/fixtures/teams_fixture.csv'
                game_teams_path = './spec/fixtures/game_teams_fixture.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.worst_coach("20122013")).to eq("John Tortorella")
            end
        end

        describe '#most and least accurate team' do
            it 'can have a team list with the names' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './data/teams.csv'
                game_teams_path = './data/game_teams.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.name_team_list).to be_a Hash
            end

            it 'returns the most accurate team' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './data/teams.csv'
                game_teams_path = './data/game_teams.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.most_accurate_team("20132014")).to eq("Orlando City SC")
            end

            it 'returns the least accurate team' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './data/teams.csv'
                game_teams_path = './data/game_teams.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.least_accurate_team("20132014")).to eq("Utah Royals FC")
            end
        end

          describe '#most and fewest tackles' do
            it 'returns the most tackles' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './data/teams.csv'
                game_teams_path = './data/game_teams.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.most_tackles("20132014")).to eq("Houston Dynamo")
            end

            it 'returns the fewest tackels' do
                game_path = './spec/fixtures/games_fixture.csv'
                team_path = './data/teams.csv'
                game_teams_path = './data/game_teams.csv'

                locations = {
                    games: game_path,
                    teams: team_path,
                    game_teams: game_teams_path
                }

                stat_tracker = StatTracker.from_csv(locations)
                expect(stat_tracker.fewest_tackles("20132014")).to eq("Chicago Red Stars")
            end
        end
    end
end
