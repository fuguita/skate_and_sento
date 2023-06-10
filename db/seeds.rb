# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'sb.fsk8@gmail.com',
  password: '925411'
  )

sections = %w(レッジ フラットレール スラッピーカーブ ダウンレール マニュアル台 フラットバンク ステア ダウンレッジ ウォール クォーター ミニランプ ボール バーチ スパイン ピラミッド)
  sections.each do |section|
    Section.find_or_create_by(name: section)
  end
