/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   run_server.js                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ymaaloum <ymaaloum@student.1337.ma>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/29 17:01:27 by ymaaloum          #+#    #+#             */
/*   Updated: 2024/05/29 17:01:28 by ymaaloum         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

const express = require('express')

const app = express()

app.use(express.static('anon'))


app.listen(3000, () => {
    console.log("server running on port 3000")
})
