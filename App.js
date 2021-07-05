import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { ImageBackground, StyleSheet, Text, SafeAreaView ,ScrollView} from 'react-native';



const image = { uri: "https://reactjs.org/logo-og.png" };

export default function App() {
  var cmd=require('node-cmd');
  
  cmd.run("cd ..");


  return (
    <SafeAreaView style={styles.container}>
      <ImageBackground source={image} style={styles.image}>
    </ImageBackground>
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff'
  },
  image: {
    flex: 1,
    resizeMode: "cover",
    justifyContent: "center"
  }
});
