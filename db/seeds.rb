# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TariffRate.create(min_km: 0, max_km: 1.5, min_order: 165, service_charge: 35, eta_delivery: '45min')
TariffRate.create(min_km: 1.6, max_km: 2.5, min_order: 220, service_charge: 45, eta_delivery: '45min')
TariffRate.create(min_km: 2.6, max_km: 3.5, min_order: 275, service_charge: 50, eta_delivery: '1hr')
TariffRate.create(min_km: 3.6, max_km: 4.5, min_order: 330, service_charge: 60, eta_delivery: '1hr')
TariffRate.create(min_km: 4.6, max_km: 5.5, min_order: 385, service_charge: 60, eta_delivery: '1hr')
TariffRate.create(min_km: 5.6, max_km: 6.5, min_order: 440, service_charge: 60, eta_delivery: '1.5hr')
TariffRate.create(min_km: 6.6, max_km: 10, min_order: 550, service_charge: 60, eta_delivery: '1.5hr')

# TariffRate.create(min_km: 10.1, max_km: 15, min_order: 750, service_charge: 60, eta_delivery: '1.5hr')