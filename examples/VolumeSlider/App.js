/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import VolumeSlider from 'react-native-volume-slider';

export default class VolumeSliderExample extends Component {
  render() {
    return (
      <View style={styles.container}>
        <VolumeSlider
          thumbSize={{
            width: 8,
            height: 8
          }}
          thumbTintColor="rgb(146,146,157)"
          minimumTrackTintColor="rgb(146,146,157)"
          maximumTrackTintColor="rgba(255,255,255, 0.1)"
          showsRouteButton
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 20,
    backgroundColor: '#eee',
  },
});
