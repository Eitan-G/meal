class Dropdown extends React.Component {

  userIsGroupAdmin () {
    return this.props.userId === this.props.admin
  }

  deleteButton () {
    if (this.props.userId === this.props.admin) {
      return <a className='btn' onClick={this.props.deleteHangout}>Delete Hangout</a>
    }
  }

  hangoutButton () {
    if (this.props.hangoutId && this.props.inHangout) {
      return <a className='btn' onClick={this.props.leaveHangout}>Leave Hangout</a>
    } else if (this.props.hangoutId) {
      return <a className='btn' onClick={this.props.joinHangout}>Join Hangout</a>
    } else {
      return <a className='btn' onClick={this.props.createHangout}>Create Hangout</a>
    }
  }

  addButton () {
    if (this.userIsGroupAdmin()) {
      return (
        <a className='btn' data-toggle='collapse' data-target='#collapseExample' aria-expanded='false' aria-controls='collapseExample'>
          Invite to Group
        </a>
      )
    }
  }

  render () {
    return (
      <div className='dropdown'>
        <button className='btn btn-primary dropdown-toggle' type='button' data-toggle='dropdown'>Options
          <span className='caret' />
        </button>
        <ul className='dropdown-menu'>
          <li>{this.hangoutButton()}</li>
          <li>{this.deleteButton()}</li>
          <li>{this.addButton()}</li>
        </ul>
      </div>
    )
  }
}
