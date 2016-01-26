/* @flow */
'use strict';

import React from 'react-native';

const {
  requireNativeComponent,
  PropTypes,
  StyleSheet,
  Component
} = React;

type Event = Object;

class VolumeSlider extends Component {

  static propTypes = {
        /**
     * The color used for the thumb.
     */
    thumbTintColor: PropTypes.string,

    /**
     * The size of the thumb area that allows moving the thumb.
     * The default is {width: 23, height: 23}.
     */
    thumbSize: PropTypes.shape({
      width: PropTypes.number,
      height: PropTypes.number
    }),

    /**
     * The color used for the track to the left of the button. Overrides the
     * default blue gradient image.
     */
    minimumTrackTintColor: PropTypes.string,

    /**
     * The color used for the track to the right of the button. Overrides the
     * default blue gradient image.
     */
    maximumTrackTintColor: PropTypes.string,

    /**
     * Callback continuously called while the user is dragging the slider.
     */
    onValueChange: PropTypes.func
  };

  static defaultProps = {
    thumbSize: { width: 23, height: 23 },
  };

  render() {

    let onValueChange = this.props.onValueChange && ((event: Event) => {
      this.props.onValueChange &&
        this.props.onValueChange(event.nativeEvent.value);
    });

    let { style, ...props } = this.props;
    style = [styles.slider, style];

    return (
      <RNVolumeView
        {...props}
        onValueChange={onValueChange}
        style={style} />
    );
  }

}

const styles = StyleSheet.create({
  slider: {
    flex: 1,
    height: 23,
  },
});

const RNVolumeView = requireNativeComponent('VolumeSlider', VolumeSlider);

export default VolumeSlider
