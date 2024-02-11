Config = {}

Config.Lokacije = {
    ['1'] = {
        blip = {
            koristi = true,
            korde = vector3(866.5538, 2876.9250, 56.9493),
            boja = 1,
            sprite = 51,
            tekst = 'Ilegalan doktor',
        },
        ped = {
            hash = 's_m_m_doctor_01',
            korde = vector4(866.5538, 2876.9250, 56.9493, 186.2975),
            tekst = 'Ozivi se',
            targetIkonica = 'fas fa-hand-holding-medical'
        },
        cena = 500, -- Kolko ce da naplati kad se reva
        revVreme = 10, -- U sekundama koliko treba raditi progressbar dok se ne ozive
    }
}