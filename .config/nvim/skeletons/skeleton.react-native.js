// @flow
// # Imports
import * as React from 'react'
import * as R from 'ramda'
import { View, StyleSheet } from 'react-native'

// # Types
type ${1:`!v substitute(expand('%:t:r'), "Screen", "", "")`}Props = {

}

type ${1:`!v substitute(expand('%:t:r'), "Screen", "", "")`}State = {

}


const styles = StyleSheet.create({

})

export class ${1:`!v expand('%:t:r')`} extends React.Component<${1:`!v substitute(expand('%:t:r'), "Screen", "", "")`}Props, ${1:`!v substitute(expand('%:t:r'), "Screen", "", "")`}State> {

    constructor(props: ${1:`!v substitute(expand('%:t:r'), "Screen", "", "")`}Props) {
        super(props)
        this.state = {
           $2
        }
    }


    // # Funcs



    // # Lifecycle
    render() {
        return (
            <View>
                $3
            </View>
        )
    }
}

