unit RutinasCompartidas;

interface

Uses
  System.SysUtils, Winapi.Windows, System.Classes, Vcl.Forms, Vcl.ComCtrls,
  Vcl.Graphics, Winapi.Messages, System.IniFiles, Vcl.Controls, System.StrUtils,
  Vcl.Grids, Vcl.DBGrids;

Const
   LF = #13#10;

var
  VersionProg    : String;
  procedure LogError(Objeto: TObject; E:Exception; ProcOrigen: String;
      EMensaje:String=''; ArchivoLog: String=''; ShowError: Boolean=true);
  procedure LogDebug(Objeto: TObject; ProcOrigen: String; EMensaje: String='';
      ArchivoLog: String=''; ShowError: Boolean=true);
  function LeerIni(RutaYArchivo: String; Seccion: String; Clave: String): String;
  function EscribirIni(RutaYArchivo:String; Seccion: String; Clave:String; Valor:String): Boolean;
  function SaveTextToFile(Content: String; NombreArchivoLog: String='Log.txt';
      LimiteMB: Integer = 15): Boolean;
  function HexaToBin(Hexadecimal: string): string;
  function HexaToInt(HexNum: string): LongInt;
  function Get_File_Size(sFileToExamine: string; bInKBytes: Boolean): string;
  function FileCopy(Barra: TProgressBar; Const SourceFn, TargetFn: String;
    Bar: Boolean):Boolean;
  function CopyCallBack(TotalFileSize: LARGE_INTEGER; // Total size of the file inbytes
            TotalBytesTransferred: LARGE_INTEGER;  // No bytes already transferred.
            StreamSize: LARGE_INTEGER;             // Total file size
        	  StreamBytesTransferred: LARGE_INTEGER; // No bytes already transferred
	  	   	  dwStreamNumber: DWord;                 // Number of the stream
	   	   	  dwCallbackReason: DWord;               // Reason for the call back.
	   	   	  hSourceFile: THandle;                  // Source handle.
	   	   	  hDestinationFile: THandle;             // Destination handle.
	   	   	  ProgressBar: TProgressBar   // Parameter passed to the function which is
	                     					  			 // a recopy of the parameter passed with
						                    				 // CopyFileEx.  It is used to pass the address
                  											 // of progress bar to be updated for the copy.
                  											 // It is an excellent idea of DelphiProg.
                        ):DWord; far; stdcall;

  ///	<summary>
  ///	  Ajusta el ancho de las columnas de una StringGrid según cada el máximo
  ///	  ancho de los campos.
  ///	</summary>
  ///	<param name="Grid">
  ///	  Grilla que se va a ajustar.
  ///	</param>
  ///	<param name="Column">
  ///	  Posición de la columna que se quiere ajustar.
  ///	</param>
  procedure AutoSizeCol(Grid: TStringGrid; Column: integer);

  ///	<summary>
  ///	  Ajusta el ancho de las columnas de una DBGrid
  ///	</summary>
  ///	<param name="Grid">
  ///	  Grilla que se va a ajustar.
  ///	</param>
  procedure AutoSizeColDBGrid(Grid: TDBGrid);

  ///	<summary>
  ///	  Ajusta el ancho de las columnas de una StringGrid según el ancho de los
  ///	  encabedazos.
  ///	</summary>
  ///	<param name="Grid">
  ///	  Grilla que se va a ajustar.
  ///	</param>
  procedure SizeColsToHeaders(Grid: TStringGrid);

  // Funcion para cambiar las / por . en las fechas que entrega Delphi
  // y poder enviarlas a Firebird.
  // Tambien se pone las comillas necesarias.
  function FechaParaFb(fecha: TDateTime): string;
  function GetFileVersion(filename: string = ''; const Fmt: string = '%d.%d.%d.%d'): string;

  // Devuelve el parametro de la configuracion regional solicitado.
  // Algunos flags se pueden encontrar en http://www.delphipages.com/forum/showthread.php?t=93573
  // La lista completa de flags se puede encontrar en Winapi.Windows.pas
  // C:\Program Files (x86)\Embarcadero\Studio\16.0\source\rtl\win\Winapi.Windows.pas (XE8)
  function GetLocaleInformation(Flag: Integer): String;

implementation

function LeerIni(RutaYArchivo, Seccion, Clave: String): String;
var
  ValorClave: String;
  ConfigIni: TIniFile;
begin
   ConfigIni := TIniFile.Create(RutaYArchivo);
   ValorClave := ConfigIni.ReadString(Seccion, Clave, '');
   ConfigIni.Free;
   Result := ValorClave;
end;

function EscribirIni(RutaYArchivo, Seccion, Clave, Valor: String): Boolean;
var
   ConfigIni: TIniFile;
begin
   Result:=False;
   Try
      //ConfigIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'PendriveFree.ini');
      ConfigIni := TIniFile.Create(RutaYArchivo);
      ConfigIni.WriteString(Seccion, Clave, Valor);
      //ConfigIni.WriteInteger('Setup Impresora','Copias', pCantCopias.AsInteger);
      ConfigIni.UpdateFile;
      ConfigIni.Free;
      result := True;
   Except

   end;
end;

procedure LogError(Objeto: TObject; E:Exception; ProcOrigen: String;
    EMensaje: String=''; ArchivoLog: String='';ShowError: Boolean=True);
var
   errLogList : TStringList;
begin
   errLogList := TStringList.Create;
   Try
      With errLogList do
      Begin
         Add('.-***************  Error  ***************-.');
         Add('Fecha y Hora: ' + FormatDateTime('dddd dd/mm/yyyy HH:mm:nn', Now));
         if Objeto <> Nil then Add('Objeto: '+ Objeto.ClassName);
         Add('Procedimiento: '+ProcOrigen);
         if EMensaje<>'' then Add('Descripción: '+EMensaje);
         Add('Clase del Error: ' + E.ClassName);
         Add('Mensaje: ' + E.Message);
         if ArchivoLog = '' then ArchivoLog:= Application.Title +' Error.log';
         SaveTextToFile(errLogList.Text,ArchivoLog)
      end;
      if ShowError then
      Begin
         if Objeto is TForm then
            Application.MessageBox(PChar('Se ha producido un error inesperado.'
                +LF+LF+errLogList.Text), PChar(Application.Title+' - Error de Proceso'),
                MB_ICONEXCLAMATION or MB_OK or MB_TASKMODAL)
         else
            Application.MessageBox(PChar('Se ha producido un error inesperado.'
                +LF+LF+errLogList.Text), PChar(Application.Title+' - Error de Proceso'),
                MB_ICONEXCLAMATION or MB_OK or MB_TASKMODAL);
      End;
   finally
      FreeAndNil(errLogList);
   end;
end;

procedure LogDebug(Objeto: TObject; ProcOrigen: String; EMensaje: String='';
    ArchivoLog: String=''; ShowError: Boolean=True);
var
   LogLst : TStringList;
begin
   LogLst := TStringList.Create;
   Try
      With LogLst do
      Begin
         if Procorigen <> '' then
         Begin
            Add('--------------------------------------------------------------');
            Add('Fecha: ' + FormatDateTime('dddd dd/mm/yyyy HH:mm:nn', Now));
            if Objeto <> Nil then Add('Objeto: '+ Objeto.ClassName);
            Add('Procedimiento: '+ProcOrigen);
            Add('');
         End;
         if EMensaje<>'' then Add('Descripción: '+EMensaje);
         if ArchivoLog = '' then ArchivoLog:= Application.Title +' - Debug.log';

         SaveTextToFile(LogLst.Text,ArchivoLog)
      end;
      if ShowError then
      Begin
         if Objeto is TForm then
            Application.MessageBox(pChar(EMensaje), PChar(Application.Title
                +' - Error de Proceso'), MB_ICONEXCLAMATION or MB_OK or MB_TASKMODAL)
         else
            Application.MessageBox(pChar(EMensaje), PChar(Application.Title
                +' - Error de Proceso'), MB_ICONEXCLAMATION or MB_OK or MB_TASKMODAL);
      End;
   finally
      FreeAndNil(LogLst);
   end;
end;

Function FileCopy(Barra: TProgressBar; Const SourceFn, TargetFn: String;
    Bar: Boolean):Boolean;
   Var Retour: LongBool;
begin
   Result:=True;    // Default result - copy OK.
   If (Win32Platform = Ver_Platform_Win32_NT) and Bar then
   begin { BAR wanted - but only possible on WinNT, 2000 or XP }
	   Barra.Visible:=True;   // Show progressbar only during copy.
      Retour := False;       // NB CopyFileEx only works on WinNT,2k or XP.}
      if not Winapi.Windows.CopyFileEx(
		   PChar(SourceFn),    // Source file name
		   PChar(TargetFn),    // Target file name.
		   @CopyCallBack,      // Address of callback function
		   Barra,              // ProgressBar to be updated. //frmMain.ProgressBar1
		   @Retour,            // Address of Boolean tested to stop the copy
		   COPY_FILE_RESTARTABLE) // Don't specify "can be restarted" or "only if not exists"
	   then Result:=False
	   else Result:=True;
   end else
   begin
      // ---code to perform copy without progressbar.---
   end;
end;

Function CopyCallBack(TotalFileSize: LARGE_INTEGER;  // Total size of the file inbytes
	 TotalBytesTransferred: LARGE_INTEGER;  // No bytes already transferred.
	 StreamSize: LARGE_INTEGER;             // Total file size
	 StreamBytesTransferred: LARGE_INTEGER; // No bytes already transferred
	 dwStreamNumber: DWord;                 // Number of the stream
	 dwCallbackReason: DWord;               // Reason for the call back.
	 hSourceFile: THandle;                  // Source handle.
	 hDestinationFile: THandle;             // Destination handle.
	 ProgressBar : TProgressBar     // Parameter passed to the function which is
					  // a recopy of the parameter passed with
					  // CopyFileEx.  It is used to pass the address
					  // of progress bar to be updated for the copy.
					  // It is an excellent idea of DelphiProg.
	 ):DWord; far; stdcall;
var
	 EnCours: Int64;
begin
 // Calculate progressbar position as a percent.  The calculation must be
 // performed using an intermediate variable of type Int64, to avoid overflow
 // of calculation in the property Position of the integer type.
 //   BB Note - look up LARGE_INTEGER to see what Quadpart is.
	 EnCours := TotalBytesTransferred.QuadPart*100 div TotalFileSize.QuadPart;
	 if ProgressBar<>Nil then ProgressBar.Position := EnCours;
	 // The function must determine whether the copy can be continued.
	 Result := PROGRESS_CONTINUE;
	 Application.ProcessMessages;  // Allow processing of messages.
end;

function SaveTextToFile(Content: String; NombreArchivoLog: String='Log.txt';
    LimiteMB: Integer = 15):Boolean;
var
	Archivo : TextFile;
	Tamanio : Integer;
//  MB      : Integer;
begin
//	Result:=False;
	AssignFile(Archivo, NombreArchivoLog);
	Try
		if not FileExists(NombreArchivoLog) then
		Begin
			Rewrite(Archivo);
		end else
		Begin
			Append(Archivo);
			Tamanio:=strToInt(Get_File_Size(NombreArchivoLog,false));  //Tamaño expresado en KB
         LimiteMB:= LimiteMB * 1024 * 1024;
			if Tamanio > LimiteMB then //Si el archivo de Log supera 15MB por defecto lo borra
			Begin
				CloseFile(Archivo);
				if DeleteFile(pChar(NombreArchivoLog))= False then
					Append(Archivo)
				else
					Rewrite(Archivo);
			end;
		end;
		WriteLn(Archivo, Content);
		Flush(Archivo);
		Result:=True;
	Finally
		CloseFile(Archivo);
	end;
end;

function Get_File_Size(sFileToExamine: string; bInKBytes: Boolean):string;
var
  SearchRec: TSearchRec;
  sgPath: string;
  inRetval, I1: Integer;
begin
  sgPath := ExpandFileName(sFileToExamine);
  try
	 inRetval := FindFirst(ExpandFileName(sFileToExamine), faAnyFile, SearchRec);
	 if inRetval = 0 then
		I1 := SearchRec.Size
	 else
		I1 := -1;
  finally
	 System.SysUtils.FindClose(SearchRec);
  end;
  Result := IntToStr(I1);
end;

procedure AutoSizeCol(Grid: TStringGrid; Column: integer);
var
  i, W, WMax: integer;
begin
  WMax := 0;
  for i := 0 to (Grid.RowCount - 1) do begin
    W := Grid.Canvas.TextWidth(Grid.Cells[Column, i]);
    if (W + 5) > WMax then
      WMax := W;
  end;
  Grid.ColWidths[Column] := WMax + 5;
end;

procedure AutoSizeColDBGrid(Grid: TDBGrid);
var
  i, wid :integer;
begin
  for i:=0 to Grid.Columns.Count-1 do begin
  wid:=Grid.Canvas.TextWidth(Grid.Columns.Items[i].Title.Caption);
  if wid > Grid.Columns.Items[i].Width then
  Grid.Columns.Items[i].Width:=wid+10; //set some free space after text
  end;
end;

procedure SizeColsToHeaders(Grid: TStringGrid);
var
  Col: integer;
begin
  for Col := 0 to (Grid.ColCount - 1) do
    Grid.ColWidths[Col] :=
      Grid.Canvas.TextWidth(Grid.Cells[Col, 0]) + 5;
end;

function FechaParaFb(fecha: TDateTime): string;
var
  year, month, day : Word;
begin
  DecodeDate(fecha, year, month, day);
  Result := IntToStr(day) + '.' + IntToStr(month) + '.' + IntToStr(year);
end;

function HexaToBin(Hexadecimal: string): string;
const
  BCD: array [0..15] of string =
    ('0000', '0001', '0010', '0011', '0100', '0101', '0110', '0111',
    '1000', '1001', '1010', '1011', '1100', '1101', '1110', '1111');
var
  i: integer;
begin
  for i := Length(Hexadecimal) downto 1 do
    Result := BCD[StrToInt('$' + Hexadecimal[i])] + Result;
end;


function HexaToInt(HexNum: string): LongInt;
begin
   Result:=StrToInt('$' + HexNum) ;
end;

function GetFileVersion(filename: string = ''; const Fmt: string = '%d.%d.%d.%d'): string;
var
  iBufferSize: DWORD;
  iDummy: DWORD;
  pBuffer: Pointer;
  pFileInfo: Pointer;
  iVer: array[1..4] of word;
begin
  // set default value
  if filename = '' then
    FileName := Application.ExeName;
  Result := '';
  // get size of version info (0 if no version info exists)
  iBufferSize := GetFileVersionInfoSize(PChar(filename), iDummy);
  if (iBufferSize > 0) then
  begin
    Getmem(pBuffer, iBufferSize);
    try
    // get fixed file info
      GetFileVersionInfo(PChar(filename), 0, iBufferSize, pBuffer);
      VerQueryValue(pBuffer, '\', pFileInfo, iDummy);
    // read version blocks
      iVer[1] := HiWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionMS);
      iVer[2] := LoWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionMS);
      iVer[3] := HiWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionLS);
      iVer[4] := LoWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionLS);
    finally
      Freemem(pBuffer);
    end;
    // format result string
    Result := Format(Fmt, [iVer[1], iVer[2], iVer[3], iVer[4]]);
  end;
end;

function GetLocaleInformation(Flag: Integer): String;
var
pcLCA: Array[0..20] of Char;
begin
if( GetLocaleInfo(LOCALE_SYSTEM_DEFAULT,Flag,pcLCA,19) <= 0 ) then
pcLCA[0] := #0;
Result := pcLCA;
end;

end.