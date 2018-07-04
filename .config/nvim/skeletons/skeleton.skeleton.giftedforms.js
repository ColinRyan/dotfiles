// @flow
// # Imports
import {
    DatePickerAndroid,
    Platform,
    TimePickerAndroid,
    View
} from "react-native"
import { Container, Button, } from "native-base"
import { GiftedForm, GiftedFormManager } from "react-native-gifted-form"
import FontAwesome from "react-native-vector-icons/FontAwesome"
import R from "ramda"
import S from "sanctuary"

import * as React from "react"
import moment from "moment"

import type { CoreProps, HealthProvider, hit, AppointmentInfo} from "../Core/CoreTypes.js"
import Repository from "../Search/Repository"
import SearchList from "../Search/SearchList"


// # Types

type timeObj = {hour: number | string, minutes: number | string}
type AddAppointmentState = {
    form: AppointmentInfo
}

export default class $1 extends React.Component<CoreProps, > {


    constructor(props: CoreProps) {
        super(props)

        console.log("GiftedFormManager.getValues('addAppointmentForm')", GiftedFormManager.getValues("addAppointmentForm"))
        console.log("this.props.screenProps.user", this.props.screenProps.user)
        this.props.navigation.setParams({
            from: {
                key: "Agenda",
                routeName: "Agenda"
            }
        })
        
        const practitionerType = GiftedFormManager.getValue("addAppointmentForm", practitionerType) || "FamilyDoctor"
            , hp = GiftedFormManager.getValue("addAppointmentForm", "healthProvider") || this.props.screenProps.user.health_providers[practitionerType]
            , defaultFormValues = {
                province: this.props.screenProps.address.region,
                mainPractitioner: (hp.id === this.props.screenProps.user.health_providers[practitionerType].id),
                practitioner: (!hp.attributes || hp.attributes.practitioner === "Clinic Name") ? "" : 
                    (hp.attributes.practitioner !== "") ? hp.attributes.practitioner : hp.attributes.clinicname,
                practitionerType: practitionerType,
                date: moment().format("YYYY-MM-DD"),
                startTime: moment().add(3, "h").format("HH:mm"),
                endTime: moment().add(3, "h").add(15, "m").format("HH:mm"),
                displayEndTime: moment().add(3, "h").add(15, "m").format("hh:mm a"),
                displayStartTime: moment().add(3, "h").add(15, "m").format("hh:mm a"),
                healthProvider: hp
            }

        R.forEachObjIndexed((value, key) => GiftedFormManager.updateValueIfNotSet("addAppointmentForm", key, value), defaultFormValues)
        const form = R.merge(defaultFormValues, GiftedFormManager.getValues("addAppointmentForm"))

        if (!defaultFormValues.mainPractitioner) {
            GiftedFormManager.updateValue("addAppointmentForm", "healthProvider", hp)
            GiftedFormManager.updateValue("addAppointmentForm", "practitioner", (hp.attributes.practitioner) ? hp.attributes.practitioner : hp.attributes.clinicname)
        }

        this.state = {
            form
        }
    }

    // # Funcs
    
    renderHit = ({ item, searchTerms }: hit): Repository => {
        const {
            logo
        } = this.props.screenProps

        const styles = {
            color: "#2ecc40",
            marginRight: 2,
            fontSize: 30,
        }
        return <Repository 
            searchTerms={searchTerms}
            repo={item} 
            image={logo}
        >
            <Button transparent
                style={{padding:15}}
                onPress={() => {
                    const state = R.clone(this.state)
                    console.log("item", item)
                    state.form.practitioner = (item.attributes.practitioner) ? item.attributes.practitioner : item.attributes.clinicname
                    state.form.healthProvider = item
                    this.setState(state)
                    GiftedFormManager.updateValue("addAppointmentorm", "practitioner", (item.attributes.practitioner) ? item.attributes.practitioner : item.attributes.clinicname)
                    GiftedFormManager.updateValue("addAppointmentForm", "healthProvider", item)
                    this.props.navigation.navigate("AddAppointment")

                }}>
                <FontAwesome name="plus" style={styles} />
            </Button>

        </Repository>
    } 
    handleValueChange(values: AppointmentInfo) {

        console.log("handleValueChange", values)

        if (Array.isArray(values.province)) {
            values.province = values.province[0]
        }
        if (Array.isArray(values.practitionerType)) {
            values.practitionerType = values.practitionerType[0]
        }
        if (this.state.form.practitionerType && values.practitionerType !== this.state.form.practitionerType) {
            const hp = this.props.screenProps.user.health_providers[values.practitionerType]

            const newHP = (hp.id === "") ? this.props.screenProps.healthProviders[values.practitionerType][0] : hp
            GiftedFormManager.updateValue("addAppointmentForm", "practitionerType", values.practitionerType)
            GiftedFormManager.updateValue("addAppointmentForm", "healthProvider", newHP)
            GiftedFormManager.updateValue("addAppointmentForm", "practitioner", newHP.attributes.practitioner || newHP.attributes.clinicname)
            values.healthProvider = newHP
            values.practitioner = newHP.attributes.practitioner || newHP.attributes.clinicname

            
        }
        this.setState({ form: values })

    }

    // # Lifecycle

    render() {
        const {
            form: {
                practitionerType,
                startTime,
                endTime
            }
        } = this.state
        const {
            healthProviders
        } = this.props.screenProps

        console.group("AddAppointment")
        
        console.log("props", this.props)
        console.log("state", this.state)
        console.log("GiftedFormManager.getValues(addAppointmentForm)", GiftedFormManager.getValues("addAppointmentForm"))
        console.groupEnd()

        const searchList = <GiftedForm.ModalWidget
            title='Practitioner'
            displayValue='practitioner'
            image={require("../../src/Assets/icons/appointment_practitioner.png")}
            onClose={() => this.props.navigation.goBack(null)}
        >
            <SearchList 
                data={healthProviders[practitionerType]}
                renderHit={this.renderHit}
            />

        </GiftedForm.ModalWidget>
        return (
            <Container>
                <View>
                    <GiftedForm
                        formName='addAppointmentForm'
                        style={{backgroundColor: "#fff"}}
                        openModal={router => {
                            console.log("this.props.navigation.navigate.state.routeName", this.props.navigation)
                            console.log("this.props.navigation.navigate.state.routeName", this.props.navigation.state.routeName)
                            console.log("router.renderScene()", router.renderScene())
                            this.props.navigation.navigate("Modal", {
                                renderContent: router.renderScene,
                                onClose: router.onClose,
                                getTitle: router.getTitle,
                                from: this.props.navigation.state.routeName
                            })
                        }}
                        clearOnClose={false}
                        onValueChange={this.handleValueChange.bind(this)}
                        formStyles={{
                            OptionWidget: {
                                row: {
                                    flexDirection: "row",
                                    alignItems: "center",
                                    height: 44,
                                    position: "relative"


                                },
                                checkmark: {
                                    alignSelf: "flex-end",
                                    marginLeft: 10,
                                    marginRight: 10,
                                    position: "absolute",
                                    right: 0


                                }

                            }
                        }}
                        validators={{
                            date: {
                                title: "Date",
                                validate: [{
                                    validator: "isAfter",
                                    arguments: [moment().utc().subtract(1, "day").format("YYYY-MM-DD")],
                                    message: "{TITLE} is not valid"
                                }

                                ]
                            },
                            startTime: {
                                title: "Start Time",
                                validate: [{
                                    validator: (...args) => {
                                        
                                        const startTime = moment(args[0], "HH:mm")
                                        return startTime.isAfter()

                                    },
                                    message: "{TITLE} must be after current time"
                                }],
                            },
                            endTime: {
                                title: "End Time",
                                validate: [{
                                    validator: (...args) => {
                                        
                                        const endTime = moment(args[0], "HH:mm")
                                            , startTime = moment(this.state.form.startTime, "HH:mm")
                                        console.log("args", args)
                                        console.log("endTime", endTime.toString())
                                        console.log("startTime", startTime.toString())
                                        console.log(endTime.diff(startTime, "minutes") )
                                        console.log(endTime.isAfter(startTime))
                                        console.log(endTime.isAfter(startTime) && endTime.diff(startTime, "minutes") >=5)
                                        return (endTime.isAfter(startTime) && endTime.diff(startTime, "minutes") >= 5)
                                    },
                                    message: "{TITLE} must be greater than startTime by at least 5 minutes"
                                }],
                            },
                            province: {
                                title: "Province",
                                validate: [{
                                    validator: "isLength",
                                    arguments: [1, 40],
                                    message: "{TITLE} is required"
                                }]
                            }
                        }}

                    >
                        {
                            Platform.OS === "ios"
                                ?   <GiftedForm.ModalWidget
                                    title='Date'
                                    displayValue='date'
                                    image={require("../../src/Assets/icons/calendar.png")}
                                    scrollEnabled={false}
                                    onClose={() => this.props.navigation.goBack(null)}
                                >
                                    <GiftedForm.SeparatorWidget/>
                                    <GiftedForm.DatePickerIOSWidget
                                        name='date'
                                        mode='date'
                                        getDefaultDate={() => {
                                            return (this.state.form.date) ? moment(this.state.form.date).toDate() : moment().toDate()
                                        }}

                                    />
                                </GiftedForm.ModalWidget>
                                :    <GiftedForm.RowValueWidget
                                    title='Date'
                                    name='date' // mandatory
                                    displayValue='Date'
                                    image={require("../../src/Assets/icons/calendar.png")}
                                    scrollEnabled={false}
                                    value={this.state.form.date}
                                    onPress={() => {
                                        DatePickerAndroid.open({
                                            date: (this.state.form.date)? new Date(this.state.form.date): new Date(),
                                            minDate: new Date(),
                                            mode: "spinner",
                                        }).then((r)=>{
                                            if (r.action !== DatePickerAndroid.dismissedAction) {
                                            // Selected year, month (0-11), day

                                                GiftedFormManager.updateValueIfNotSet("addAppointmentForm", "date", `${r.year}-${("0" + (r.month + 1)).slice(-2)}-${("0" + r.day).slice(-2)}`)
                                                const state = R.clone(this.state)
                                                state.form.date = `${r.year}-${("0" + (r.month + 1)).slice(-2)}-${("0" + r.day).slice(-2)}`
                                                this.setState(state)
                                            }
                                        }).catch((code,message)=>console.warn("Cannot open date picker", message))
                                    }}
                                />
                        }
                        { (Platform.OS === "ios") 
                            ? <GiftedForm.ModalWidget
                                title='Start Time'
                                name='startTime' // mandatory
                                displayValue='startTime'
                                image={require("../../src/Assets/icons/appointment_time.png")}
                                onClose={() => this.props.navigation.goBack(null)}
                            >
                                <GiftedForm.SeparatorWidget />
                                <GiftedForm.DatePickerIOSWidget
                                    name='startTime'
                                    mode='time'
                                />

                            </GiftedForm.ModalWidget>
                            :    <GiftedForm.RowValueWidget
                                title='Start Time'
                                name='startTime' // mandatory
                                displayValue='startTime'
                                image={require("../../src/Assets/icons/appointment_time.png")}
                                scrollEnabled={false}
                                value={startTime}
                                onPress={() => {
                                    TimePickerAndroid.open({
                                        hour: (startTime) ? parseInt(startTime.split(":")[0]) : 0,
                                        minute: (startTime) ? parseInt(startTime.split(":")[1]) : 0,
                                    }).then((r)=>{
                                        if (r.action !== TimePickerAndroid.dismissedAction) {
                                        // Selected year, month (0-11), day
                                            const formatTime = ({hour, minutes}: timeObj): string => `${(hour % 12) || 12}:${("0" + minutes).slice(-2)} ${(hour < 12) ? "am" : "pm"}`
                                            const state = R.clone(this.state)
                                            state.form.startTime = `${("0" + r.hour).slice(-2)}:${("0" + r.minute).slice(-2)}`
                                            state.form.endTime = `${("0" + r.hour).slice(-2)}:${("0" + (r.minute + 15)).slice(-2)}`
                                            state.form.displayStartTime = formatTime({
                                                hour: state.form.startTime.split(":")[0],
                                                minutes: state.form.startTime.split(":")[1]

                                            })
                                            state.form.displayEndTime = formatTime({
                                                hour: state.form.startTime.split(":")[0],
                                                minutes: state.form.startTime.split(":")[1] + 15

                                            })
                                            GiftedFormManager.updateValue("addAppointmentForm", "startTime", `${("0" + r.hour).slice(-2)}:${("0" + r.minute).slice(-2)}`)
                                            GiftedFormManager.updateValue("addAppointmentForm", "displayStartTime", state.form.displayStartTime )
                                            GiftedFormManager.updateValue("addAppointmentForm", "endTime", `${("0" + r.hour).slice(-2)}:${("0" + r.minute).slice(-2)}`)
                                            GiftedFormManager.updateValue("addAppointmentForm", "displayEndTime", state.form.displayEndTime )
                                            this.setState(state)
                                        }
                                    }).catch((code,message)=>console.warn("Cannot open date picker", message))
                                }}
                            />
                        }
                        { (Platform.OS === "ios") 
                            ? <GiftedForm.ModalWidget
                                title='End Time'
                                name='endTime' // mandatory
                                displayValue='endTime'
                                image={require("../../src/Assets/icons/appointment_time.png")}
                                onClose={() => this.props.navigation.goBack(null)}
                            >
                                <GiftedForm.SeparatorWidget />
                                <GiftedForm.DatePickerIOSWidget
                                    name='endTime'
                                    mode='time'
                                />
                            </GiftedForm.ModalWidget>
                            :    <GiftedForm.RowValueWidget
                                title='End Time'
                                name='endTime' // mandatory
                                displayValue='endTime'
                                image={require("../../src/Assets/icons/appointment_time.png")}
                                scrollEnabled={false}
                                value={endTime}
                                onPress={() => {
                                    TimePickerAndroid.open({
                                        hour: (endTime) ? parseInt(endTime.split(":")[0]) : 0,
                                        minute: (endTime) ? parseInt(endTime.split(":")[1]) : 0,
                                    }).then((r)=>{
                                        if (r.action !== TimePickerAndroid.dismissedAction) {
                                        // Selected year, month (0-11), day
                                            const formatTime = ({hour, minutes}: timeObj): string => `${(hour % 12) || 12}:${("0" + minutes).slice(-2)} ${(hour < 12) ? "am" : "pm"}`
                                            const state = R.clone(this.state)
                                            state.form.endTime = `${("0" + r.hour).slice(-2)}:${("0" + r.minute).slice(-2)}`
                                            state.form.displayEndTime = formatTime({
                                                hour: state.form.endTime.split(":")[0],
                                                minutes: state.form.endTime.split(":")[1]

                                            })
                                            GiftedFormManager.updateValue("addAppointmentForm", "endTime", `${("0" + r.hour).slice(-2)}:${("0" + r.minute).slice(-2)}`)
                                            GiftedFormManager.updateValue("addAppointmentForm", "displayEndTime", state.form.displayEndTime )
                                            this.setState(state)
                                        }
                                    }).catch((code,message)=>console.warn("Cannot open date picker", message))
                                }}
                            />
                        }

                        <GiftedForm.ModalWidget
                            title='Practitioner Type'
                            displayValue='practitionerType'
                            onClose={() => this.props.navigation.navigate("AddAppointment")}
                            image={require("../../src/Assets/icons/appointment_type.png")}
                        >
                            <GiftedForm.SeparatorWidget />

                            <GiftedForm.SelectWidget name='practitionerType' title='Appointment Type' multiple={false}>
                                <GiftedForm.OptionWidget image={require("../../src/Assets/Images/MapIcons/familydoctor.png")} title='Family Doctor' value='FamilyDoctor'/>
                                <GiftedForm.OptionWidget image={require("../../src/Assets/Images/MapIcons/dentist.png")} title='Dentist' value='Dentist'/>
                                <GiftedForm.OptionWidget image={require("../../src/Assets/Images/MapIcons/physio.png")} title='Physiotherapy' value='Physiotherapist'/>
                                <GiftedForm.OptionWidget image={require("../../src/Assets/Images/MapIcons/eyedoctor.png")} title='Optometrist' value='Optometrist'/>
                            </GiftedForm.SelectWidget>
                        </GiftedForm.ModalWidget>

                        {searchList}
                        <GiftedForm.ErrorsWidget/>
                        <GiftedForm.SubmitWidget
                            title='Create Appointment'
                            widgetStyles={{
                                submitButton: {
                                    backgroundColor: "#0074D9",
                                }
                            }}
                            onSubmit={async (isValid, values, validationResults, postSubmit = null, modalNavigator = null) => {
                                console.log("values", values)
                                console.log("validationResults", validationResults)
                                if (isValid === true) {
                                    // prepare object

                                    if (Array.isArray(values.practitionerType) ) {
                                        values.practitionerType = values.practitionerType[0]
                                    }


                                    if (Array.isArray(values.province) ) {
                                        values.province = values.province[0]
                                    }

                                    /* Implement the request to your server using values variable
                 ** then you can do:
                 ** postSubmit(['An error occurred, please try again']); // disable the loader and display an error message
                 ** postSubmit(['Username already taken', 'Email already taken']); // disable the loader and display an error message
                 ** GiftedFormManager.reset('signupForm'); // clear the states of the form manually. 'signupForm' is the formName used
                 */
                                    if (false) {
                                        postSubmit(false)
                                    } else {

                                        await this.props.screenProps.createAppointment(values)

                                        GiftedFormManager.reset("addAppointmentForm")

                                        this.props.navigation.navigate("Agenda")
                                    }

                                }
                                postSubmit()
                            }}

                        />
                    </GiftedForm>
                </View>
            </Container>
        )
    }
}
