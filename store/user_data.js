export const state = () => ({
    my_address: "",
    my_gene_data: [],
    my_mined_gene_data: [],
    my_use_event_data: [],
    my_made_use_event_data: []
})

export const mutations = {
    get_my_address(state, address){
        state.my_address = address;
    },
    get_my_gene_data(state, gene_data){
        state.my_gene_data = gene_data
    },
    get_my_mined_gene_data(state, mined_gene_data){
        state.my_mined_gene_data = mined_gene_data
    },
    get_my_use_event_data(state, use_event_data){
        state.my_use_event_data = use_event_data
    },
    get_my_made_use_event_data(state, made_use_event_data){
        state.my_made_use_event_data = made_use_event_data
    },
}

export const actions = {
    get_my_address({commit}, address){
        commit('get_my_address', address)
    },
    get_my_gene_data({commit}, my_gene_data){
        commit('get_my_gene_data', my_gene_data)
    },
    get_my_mined_gene_data({commit}, mined_gene_data){
        commit('get_my_mined_gene_data', mined_gene_data)
    },    
    get_my_use_event_data({commit}, use_event_data){
        commit('get_my_use_event_data', use_event_data)
    },    
    get_my_made_use_event_data({commit}, made_use_event_data){
        commit('get_my_made_use_event_data', made_use_event_data)
    },

}
