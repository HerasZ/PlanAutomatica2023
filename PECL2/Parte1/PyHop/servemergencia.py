from pyhop import hop

def mover(state,dron,inicio,fin):
    if state.loc[dron] == inicio:
        mod_state = state
        mod_state.loc[dron] = fin
        return mod_state
    else : return False

def coger_caja(state,caja,dron,brazo):
    if state.loc[dron] == state.loc[caja] and state.cargabrazo[dron][brazo] == None:
        mod_state = state
        mod_state.loc[caja] = dron
        mod_state.cargabrazo[dron][brazo] = caja
        return mod_state
    else: return False

def dar_caja(state,caja,dron,persona,brazo):
    if state.loc[dron] == state.loc[persona] and state.cargabrazo[dron][brazo] == caja:
        mod_state = state
        mod_state.loc[caja] = state.loc[persona]
        mod_state.cargabrazo[dron][brazo] = None
        mod_state.necesita_contenido[persona].remove(state.contiene[caja])
        if mod_state.necesita_contenido[persona] == []:
            mod_state.necesita_contenido.pop(persona)
        return mod_state
    else: return False

hop.declare_operators(mover, coger_caja, dar_caja)

def enviar_caja(state, dron, persona, contenido):
    if state.necesita_contenido[persona] != []:
        for caja in state.caja:
            for brazo in state.cargabrazo[dron].keys():
                if state.contiene[caja] == contenido and state.cargabrazo[dron][brazo] == None:
                    return [('coger_caja', caja, dron, brazo),
                            ('mover', dron, state.loc[dron], state.loc[persona]),
                            ('dar_caja', caja, dron, persona, brazo),
                            ('mover', dron, state.loc[persona], state.base)]
                
def enviar_todo(state, goal):
    if state.necesita_contenido != goal:
        for persona in state.necesita_contenido.keys():
            for contenido in state.necesita_contenido[persona]:
                return [('enviar_caja', state.dron, persona, contenido)] + [('enviar_todo', goal)]
    else: return []

hop.declare_methods('enviar_caja', enviar_caja)
hop.declare_methods('enviar_todo', enviar_todo)

state = hop.State('state')
state.dron = 'dron1'
state.base = 'base'
state.localizacion = ['base', 'loc1', 'loc2']
state.caja = ['caja1', 'caja2']
state.personas = ['mario', 'mike']
state.loc = {'dron1':'base', 'caja1':'base', 'caja2':'base', 'mario':'loc1', 'mike':'loc2'}
state.cargabrazo = {'dron1': {'dron1_brazod':None, 'dron1_brazoi':None}}
state.contiene = {'caja1':'medicina', 'caja2':'comida'}
state.necesita_contenido = {'mario':['comida'], 'mike':['medicina']}

plan = hop.plan(state, [('enviar_todo', {})], hop.get_operators(), hop.get_methods(), 3)





