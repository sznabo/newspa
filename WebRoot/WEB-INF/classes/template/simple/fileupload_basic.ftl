<#--
/*
 * $Id: actionerror.ftl 805635 2009-08-19 00:18:54Z musachy $
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
-->
<#assign uploadSavePath=parameters.uploadSavePath />
<#assign name=parameters.name />
<#assign id=parameters.id />
<input type="hidden" name="${name}" />
<input type="hidden" name="boyue_fileupload_savepath_${name}" value="${uploadSavePath}" />
<input type="file" name="boyue_fileupload_${name}"  id="${id}"/>