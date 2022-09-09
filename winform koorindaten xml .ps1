#Assembly
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing.ColorTranslator.FromHtml")


    $LocationX =300
    $LocationY =300
if ((Test-Path  .\ModConfig.xml -PathType leaf) -eq $true )
{    
    if((Get-Content .\ModConfig.xml) -eq $Null -or  $xobj.Property.Size.Height -eq $null -or $xobj.Property.Size.Width  -eq $null -or $xobj.Property.Location.Y -eq $null -or $xobj.Property.Location.X -eq $null)
    {
    [System.Windows.Forms.MessageBox]::Show("ModConfig Werte fehlen. Standardwerte werden geladen")
    $ModXmlConfig = New-Object System.Xml.XmlTextWriter(".\ModConfig.xml", [System.Text.Encoding]::UTF8 )
    #Formatierung
    $ModXmlConfig.Formatting = "Indented"
    $ModXmlConfig.Indentation = 1
    ###############
    $ModXmlConfig.WriteStartDocument()

    $ModXmlConfig.WriteStartElement("Property")
    $ModXmlConfig.WriteStartElement("Size")
    $ModXmlConfig.WriteElementString("Height" , 300)
    $ModXmlConfig.WriteElementString("Width" , 500)
    $ModXmlConfig.WriteEndElement()

    $ModXmlConfig.WriteStartElement("Location")
    $ModXmlConfig.WriteElementString("X" , $LocationX)

    $ModXmlConfig.WriteElementString("Y" , $LocationY)
    $ModXmlConfig.WriteEndElement()


    $ModXmlConfig.WriteEndDocument()
    $ModXmlConfig.Flush()
    $ModXmlConfig.Close()

    #####################
    $objForm.Height = 300
    $objForm.Width = 500
    $objForm.Location =  New-Object System.Drawing.Point( $LocationX,  $LocationY) 
    }

    $xfile = ".\ModConfig.xml"
    #Anlegen eines XML Objektes (leer)
    $xobj = New-Object XML
    # Laden des XML Dokumentes in das XML Objekt
    # Kann nicht geladen werden wegen xml writer process
 
    #XMLClose
    $xobj.Load($xfile)          
    Write-Host("Modified Height: "+$xobj.Property.Size.Height)
    Write-Host("Modified Width: "+ $xobj.Property.Size.Width )
    Write-Host("Modified X: "+$xobj.Property.Location.X)
    Write-Host("Modified Y: "+$xobj.Property.Location.Y)
    Write-Host("modified LColor: "+ $xobj.Property.LabelColor.BackColor.Color)
    Write-Host("modified LForeColor: "+ $xobj.Property.LabelColor.ForeColor.Color)
    Write-Host("modified GroupBoxFColor: "+ $xobj.Property.GroupBox.ForeColor.Color)
    $objForm = New-Object System.Windows.Forms.Form
    $objForm.StartPosition = 'Manual'  
    if ((Test-Path  .\ModConfig.xml -PathType leaf) -eq $true )
    {  
    
    }
    $objForm.Height = $xobj.Property.Size.Height
    $objForm.Width = $xobj.Property.Size.Width  
    $objForm.Location =  New-Object System.Drawing.Point($xobj.Property.Location.X, $xobj.Property.Location.Y)    
    
    
}
else
{
    [System.Windows.Forms.MessageBox]::Show("ModConfig fehlt")
    if ((Test-Path  .\StockConfig.xml -PathType leaf) -eq $true )
    {
        $xfile2 = ".\StockConfig.xml"
    #Anlegen eines XML Objektes (leer)
    $xobj2 = New-Object XML
    # Laden des XML Dokumentes in das XML Objekt
    $xobj2.Load($xfile2) 
    Write-Host("Stock Height: "+$xobj2.Property.Size.Height)
    Write-Host("Stock Height: "+$xobj2.Property.Size.Width)
    Write-Host("Stock X: "+$xobj2.Property.Location.X)
    Write-Host("Stock X: "+$xobj2.Property.Location.Y)

    $objForm = New-Object System.Windows.Forms.Form
    $objForm.StartPosition = 'Manual'
    
    $objForm.Height = $xobj2.Property.Size.Height
    $objForm.Width = $xobj2.Property.Size.Width  
    $objForm.Location =  New-Object System.Drawing.Point($xobj2.Property.Location.X, $xobj2.Property.Location.Y) 
     #$ModXmlConfig = New-Object System.Xml.XmlTextWriter(".\ModConfig.xml", [System.Text.Encoding]::UTF8 )
    }
    else
    {
        [System.Windows.Forms.MessageBox]::Show("StockConfig fehlt")
        [System.Windows.Forms.MessageBox]::Show("Programm neustarten")
        $objForm.Height = 300
        $objForm.Width = 500
        

    }
    
       
}
    #Variables
    #$ModXmlConfig = New-Object System.Xml.XmlTextWriter(".\ModConfig.xml", [System.Text.Encoding]::UTF8 )
    $xmlConfig = New-Object System.Xml.XmlTextWriter(".\StockConfig.xml", [System.Text.Encoding]::UTF8 )
    
    
    $XMLButtonimage = [System.Drawing.Image]::FromFile(".\xml.jpg")
    $JSONButtonimage =[System.Drawing.Image]::FromFile(".\json.png")

    $XMLButtonClick = ".\StockConfig.xml"
    $JSonButtonClick = ".\jsonconfig.json"
    


#Schreibvorgang
function xmlWriter{

#Formatierung
$xmlConfig.Formatting = "Indented"
$xmlConfig.Indentation = 1
###############
$xmlConfig.WriteStartDocument()
$xmlConfig.WriteStartElement("Property")
$xmlConfig.WriteStartElement("Size")
$xmlConfig.WriteElementString("Height" , 300)
$xmlConfig.WriteElementString("Width" , 500)
$xmlConfig.WriteEndElement()

$xmlConfig.WriteStartElement("Location")
$xmlConfig.WriteElementString("X" , $objForm.Location.X)
$xmlConfig.WriteElementString("Y" , $objForm.Location.Y)
$xmlConfig.WriteEndElement()

$xmlConfig.WriteEndDocument()
$xmlConfig.Flush()
$xmlConfig.Close()
}
xmlWriter
function XMLClose{

#Formatierung
$xmlConfig.Formatting = "Indented"
$xmlConfig.Indentation = 1
###############



$xmlConfig.Close()
}
#Schreibvorgang
function ModXmlWriter{
$ModXmlConfig = New-Object System.Xml.XmlTextWriter(".\ModConfig.xml", [System.Text.Encoding]::UTF8 )
#Formatierung
$ModXmlConfig.Formatting = "Indented"
$ModXmlConfig.Indentation = 1
###############
$ModXmlConfig.WriteStartDocument()
$ModXmlConfig.WriteStartElement("Property")
$ModXmlConfig.WriteStartElement("Size")
$ModXmlConfig.WriteElementString("Height" , $objForm.height)
$ModXmlConfig.WriteElementString("Width" , $objForm.width)
$ModXmlConfig.WriteEndElement()

$ModXmlConfig.WriteStartElement("Location")
$ModXmlConfig.WriteElementString("X" , $objForm.Location.X)
$ModXmlConfig.WriteElementString("Y" , $objForm.Location.Y)
$ModXmlConfig.WriteEndElement()

$ModXmlConfig.WriteStartElement("LabelColor")
$ModXmlConfig.WriteStartElement("BackColor")
$ModXmlConfig.WriteElementString("Color" , "DarkSlateGray")
$ModXmlConfig.WriteEndElement()
$ModXmlConfig.WriteStartElement("ForeColor")
$ModXmlConfig.WriteElementString("Color" , "White")
$ModXmlConfig.WriteEndElement()
$ModXmlConfig.WriteEndElement()

$ModXmlConfig.WriteStartElement("GroupBox")
$ModXmlConfig.WriteStartElement("ForeColor")
$ModXmlConfig.WriteElementString("Color" , "White")
$ModXmlConfig.WriteEndElement()

$ModXmlConfig.WriteEndDocument()
$ModXmlConfig.Flush()
$ModXmlConfig.Close()
}


$objForm.Add_Resize({ 
    if ($objForm.Size -ne [System.Drawing.Size]::$xobj2.Property.Size.Height,$xobj2.Property.Size.Width){
        #[System.Windows.Forms.MessageBox]::Show("Form wurde veraendert!")
        $label.Text = 'Breite ' +$objForm.width 
        $label2.Text = 'Hoehe ' +$objForm.height             
    }
})
#############################################
$objForm.Add_LocationChanged({
    if ($objForm.Location.X -ne $xobj2.Property.Location.X )
    {        
        $label3.Text = 'X ' +$this.Location.X     
    }
    
    if($objForm.Location.Y -ne $xobj2.Property.Location.Y)
    {
        $label4.Text ='Y ' +$this.Location.Y
    }

    })
############################################

$objForm.Text ="Property"
$objForm.Add_Closing({param($sender,$e)
    $result = [System.Windows.Forms.MessageBox]::Show(`
        "Save Config and Exit?", `
        "Exit ", [System.Windows.Forms.MessageBoxButtons]::YesNoCancel)
    if ($result -ne [System.Windows.Forms.DialogResult]::Yes)
    {    
        #xmlWriter
        XMLClose   
        $e.Cancel= $false
        $objForm.Dispose()
    }
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes)
    {                
        ModXmlWriter
        $e.Cancel= $false
        $objForm.Dispose()
    }   
    
})
$objForm.MinimumSize = New-Object System.Drawing.Size(450,220)

############################################
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(30,40)
$label.Size = New-Object System.Drawing.Size(80,20)
if((Test-Path  .\ModConfig.xml -PathType leaf) -eq $true -and $xobj.Property.LabelColor.BackColor.Color -ne $null)
{
    $Label.BackColor = $xobj.Property.LabelColor.BackColor.Color
    $Label.ForeColor= $xobj.Property.LabelColor.ForeColor.Color
    #$objForm.BackColor = "DarkSlateGray"
    $objForm.BackColor =    [System.Drawing.ColorTranslator]::FromHtml("#161616")

}
else
{
    $Label.BackColor = "ControlDark"    
}

$label.Text = 'Breite ' +$objForm.width 

$objForm.Controls.Add($label)


$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(120,40)
$label2.Size = New-Object System.Drawing.Size(80,20)
$label2.Text = 'Hoehe ' +$objForm.height

if((Test-Path  .\ModConfig.xml -PathType leaf) -eq $true -and $xobj.Property.LabelColor.BackColor.Color -ne $null)
{
    $label2.BackColor = $xobj.Property.LabelColor.BackColor.Color
    $label2.ForeColor= $xobj.Property.LabelColor.ForeColor.Color
}
else
{
    $label2.BackColor = "ControlDark"    
}




$objForm.Controls.Add($label2)
 # GroupBox1
    
    $groupBox1 = New-Object System.Windows.Forms.GroupBox
    $groupBox1.Location = '20,20' 
    $groupBox1.size = '200,55'
    $groupBox1.text = "Size Values"
    $groupBox1.Visible = $true
        
if((Test-Path  .\ModConfig.xml -PathType leaf) -eq $true -and $xobj.Property.GroupBox.ForeColor.Color -ne $null)
{
    
    $groupBox1.ForeColor= $xobj.Property.GroupBox.ForeColor.Color

}
    

    $objForm.Controls.Add($groupBox1)

    #Label
    $label3 = New-Object System.Windows.Forms.Label
    $label3.Location = New-Object System.Drawing.Point(30,120)
    $label3.Size = New-Object System.Drawing.Size(80,20)
    $label3.Text = 'X: ' + $private:LocationX
    
if((Test-Path  .\ModConfig.xml -PathType leaf) -eq $true -and $xobj.Property.LabelColor.BackColor.Color -ne $null)
{
    $label3.BackColor = $xobj.Property.LabelColor.BackColor.Color
    $label3.ForeColor= $xobj.Property.LabelColor.ForeColor.Color

}
else
{
    $label3.BackColor = "ControlDark"    
}


    $objForm.Controls.Add($label3)

    #Label
    $label4 = New-Object System.Windows.Forms.Label
    $label4.Location = New-Object System.Drawing.Point(120,120)
    $label4.Size = New-Object System.Drawing.Size(80,20)
    $label4.Text = 'Y:  ' + $private:LocationY
    if((Test-Path  .\ModConfig.xml -PathType leaf) -eq $true -and $xobj.Property.LabelColor.BackColor.Color -ne $null)
{
    $label4.BackColor = $xobj.Property.LabelColor.BackColor.Color
    $label4.ForeColor= $xobj.Property.LabelColor.ForeColor.Color
}
else
{
    $label4.BackColor = "ControlDark"    
}

    $objForm.Controls.Add($label4)

# GroupBox2
    $groupBox2 = New-Object System.Windows.Forms.GroupBox
    $groupBox2.Location = '20,100' 
    $groupBox2.size = '200,55'
    $groupBox2.text = "Location Points"
    $groupBox2.Visible = $true
            
if((Test-Path  .\ModConfig.xml -PathType leaf) -eq $true -and $xobj.Property.GroupBox.ForeColor.Color -ne $null)
{
    
    $groupBox2.ForeColor= $xobj.Property.GroupBox.ForeColor.Color

}
    

    $objForm.Controls.Add($groupBox2)


   

    #Button
    $button1 = New-Object system.windows.Forms.Button
    $button1.Width = 50
    $button1.Height = 60
    $button1.location = new-object system.drawing.point(250,50)
    $button1.Add_Click({Start-Process notepad.exe $XMLButtonClick -WindowStyle Maximized })

    $button1.Image = $XMLButtonimage
    $objForm.controls.Add($button1)

    #Button
    $button2 = New-Object system.windows.Forms.Button
    $button2.Width = 50
    $button2.Height = 60
    $button2.location = new-object system.drawing.point(320,50)
    $button2.Add_Click({Start-Process notepad.exe $JSonButtonClick -WindowStyle Maximized})
    $button2.Visible = $true
    $button2.Image = $JSONButtonimage
    $objForm.controls.Add($button2)

 # GroupBox3
    $groupBox3 = New-Object System.Windows.Forms.GroupBox
    $groupBox3.Location = '240,20' 
    $groupBox3.size = '170,100'
    $groupBox3.text = "Stock Config Files"
    $groupBox3.Visible = $true
    if((Test-Path  .\ModConfig.xml -PathType leaf) -eq $true -and $xobj.Property.GroupBox.ForeColor.Color -ne $null)
{
    
    $groupBox3.ForeColor= $xobj.Property.GroupBox.ForeColor.Color

}

    $objForm.Controls.Add($groupBox3)
[void] $objForm.ShowDialog()