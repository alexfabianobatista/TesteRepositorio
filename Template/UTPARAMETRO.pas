unit UTParametro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask, LFaxUtils, IniFiles, TypInfo,
  DBGrids;

type
  TFTParametro = class(TForm)
    PGRelatorio: TPageControl;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    RGPreview: TRadioGroup;
    procedure FormDeactivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    function GetTelaConsultaLFAXClass: TFormClass;
    procedure SetTelaConsultaLFAXClass(const Value: TFormClass);

  protected
    procedure RefreshCharCase;
  public
    procedure AtivaPagina(Index: Integer);
    property TelaConsultaLFAXClass: TFormClass read GetTelaConsultaLFAXClass write SetTelaConsultaLFAXClass;
  end;

  TLFaxProvider = class(TInterfacedObject, ILFaxProvider)
  private
    FLogin: String;
    FPassword: String;
    FFirm: String;
    FFirmPhone: String;
    FContact: String;
    FSecondFaxNumber: String;
    FPriority: String;
    FFacePage: String;
    FSubject: String;
    FTelaConsulta: TForm;
    FTelaConsultaLFAXClass: TFormClass;
  public
    constructor Create;
    procedure Free;
    procedure UpdateData;
    function GetFaxNumber: String;
    function GetLogin: string;
    function GetPassword: string;
    function GetDate: TDateTime;
    function GetFirm: string;
    function GetFirmPhone: String;
    function GetContact: string;
    function GetSubject: string;
    function GetComment: string;
    function GetSecondFaxNumber: String;
    function GetPriority: string;
    function GetFacePage: string;
    function GetLFaxDirectory: string;
    property TelaConsultaLFAXClass: TFormClass read FTelaConsultaLFAXClass write FTelaConsultaLFAXClass;
  end;

var
  FTParametro: TFTParametro;
  LFaxProvider: TLFaxProvider;
  Cadastros: Array of String;

implementation

uses UParamSistema_cl, UOracle_cl, UBiblioteca, StrUtils,
  UCadastroTelefone, UUsuario_cl;

{$R *.DFM}

procedure TFTParametro.FormDeactivate(Sender: TObject);
Var wQtdePagina : Integer;
begin
  For wQtdePagina := 0 to PGRelatorio.PageCount-1 do
  Begin
//    PGRelatorio.Pages[wQtdePagina].Enabled := False;
    PGRelatorio.Pages[wQtdePagina].TabVisible := False;
  End;
end;

procedure TFTParametro.FormCreate(Sender: TObject);
Var wQtdePagina : Integer;
begin
  For wQtdePagina := 0 to PGRelatorio.PageCount-1 do
  Begin
//    PGRelatorio.Pages[wQtdePagina].Enabled := False;
    PGRelatorio.Pages[wQtdePagina].TabVisible := False;
  End;
  Self.Constraints.MinHeight := Self.Height;
  Self.Constraints.MinWidth := Self.Width;

  PGRelatorio.TabOrder := 0;
  RGPreview.TabOrder := 1;
  BtOk.TabOrder := 2;
  BtCancela.TabOrder := 3;

//  LFaxProvider := TLFaxProvider.Create;
end;

procedure TFTParametro.RefreshCharCase; 
begin
  if DMParamSistema.QParamSistemaIND_MAIUSCULO_PARAMETRO.Value = 'S' then
    Bib.charCaseComps(Bib.componentsAsArray(self), ecUpperCase, Self.Name)
  else
    Bib.charCaseComps(Bib.componentsAsArray(self), ecNormal, Self.Name);
end;

procedure TFTParametro.FormActivate(Sender: TObject);
begin
  RefreshCharCase;
end;

procedure TFTParametro.AtivaPagina(Index: Integer);
begin
  PGRelatorio.Pages[Index].TabVisible := True;
end;

procedure TFTParametro.BtOkClick(Sender: TObject);
var
  Pagina: TTabSheet;
  I, J: Integer;
  Frame: TFrame;
  fc: TFormClass;
begin
  SetLength(Cadastros, 0);
  Pagina := PGRelatorio.ActivePage;
  if Pagina <> nil then
  begin
    try
      for i := 0 to Self.ComponentCount - 1 do
      begin
        if (Self.Components[i] is TFrame) and (Self.Components[i].ClassName = 'TFmCadastro') and
          (TFrame(Self.Components[i]).Parent = Pagina) then
        begin
          Frame := (Self.Components[i] as TFrame);
          if GetOrdProp(Frame, 'Codigo') > 0 then
          begin
            J := Length(Cadastros);
            SetLength(Cadastros, J + 1);
            Cadastros[J] := IntToStr(GetOrdProp(Frame, 'Codigo'));
          end;
        end;
      end;
    except
      on E: Exception do
      begin
        MessageDlg('Erro: ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  end;
  TLFax.VerifyInstance;
  if LFaxProvider = nil then
    LFaxProvider := TLFaxProvider.Create;
  if Pagina <> nil then
    LFaxProvider.FSubject := Pagina.Caption;
  LFax.Provider := LFaxProvider;
  LFax.Enabled := True;
end;

function TLFaxProvider.GetComment: string;
begin
  Result := '';
end;

function TLFaxProvider.GetContact: string;
begin
  Result := FContact;
end;

function TLFaxProvider.GetDate: TDateTime;
begin
  Result := Now;
end;

function TLFaxProvider.GetFacePage: string;
begin
  Result := FFacePage;
end;

function TLFaxProvider.GetFaxNumber: String;
var
  Fone: String;
begin
  if Length(Cadastros) = 0 then
  begin
    try
      MessageDlg('Desculpe, não foi possível encontrar o cliente para ser enviado o relatório.'+
        #13+#10+'Por favor, informe manualmente.', mtInformation, [mbOK], 0);
      if FTelaConsultaLFAXClass = nil then
        FTelaConsultaLFAXClass := TFormClass(GetClass('TFCadastroCons'));
      if FTelaConsulta = nil then
        FTelaConsulta := FTelaConsultaLFAXClass.Create(Application);
//      if FCadastroCons = nil then
//        FCadastroCons := TFCadastroCons.Create(Application);
      if FTelaConsulta.ShowModal = MrOk then
      begin
        Fone := (FTelaConsulta.FindComponent('DBGrid1') as TDBGrid).DataSource.DataSet.FieldByName('DESC_FAX').Value;
        if Fone = '' then
        begin
          MessageDlg('Cadastro não possui número de FAX informado.', mtError, [mbOK], 0);
          Abort;
        end;
      end
      else
        Abort;
    except
      on E: Exception do
      begin
        if E.Message <> 'Operation aborted' then
          MessageDlg('Erro ao abrir tela de consulta de cadastro. Abortando.' + #13 + #10 +
            E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;
  end
  else
  begin
    if FCadastroTelefone = nil then
      FCadastroTelefone := TFCadastroTelefone.Create(Application);
    if FCadastroTelefone.Mostra(Cadastros) = MrOk then
      Fone := FCadastroTelefone.Telefone
    else
      Abort;
  end;
  Result := Bib.LimpaNumero(Fone);
end;

function TLFaxProvider.GetFirm: string;
begin
  Result := FFirm;
end;

function TLFaxProvider.GetFirmPhone: String;
begin
  Result := FFirmPhone;
end;

function TLFaxProvider.GetLogin: string;
begin
  Result := FLogin;
end;

function TLFaxProvider.GetPassword: string;
begin
  Result := FPassword;
end;

function TLFaxProvider.GetPriority: string;
begin
  Result := FPriority;
end;

function TLFaxProvider.GetSecondFaxNumber: String;
begin
  Result := FSecondFaxNumber;
end;

function TLFaxProvider.GetSubject: string;
begin
  Result := FSubject;
end;

function TLFaxProvider.GetLFaxDirectory: string;
  procedure Abortar;
  begin
    MessageDlg('Operação cancelada.', mtInformation, [mbOK], 0);
    Abort;
  end;
var
  IniFile: TIniFile;
  BufSize: Cardinal;
  UserName: array[0..127] of AnsiChar;
  CemapaConfig: String;
begin
  //Verificando configuraçao do LFax
  CemapaConfig := ExtractFilePath(Application.ExeName) + 'cemapa.ini';
  FileSetAttr(CemapaConfig, FileGetAttr(CemapaConfig) or faHidden);
  IniFile := TIniFile.Create(CemapaConfig);
  Result := IniFile.ReadString('lfax', 'configFile', '');
  if Result = '' then
  begin
    //Usuario logado
    BufSize := SizeOf(UserName);
    GetUserName(UserName, BufSize);
    Result := 'C:\Documents and Settings\' + UserName + '\lfax.ini';
  end;
  if not FileExists(Result) then
    with TOpenDialog.Create(Application) do
    begin
      Title := 'Configuração do LFax';
      InitialDir := 'C:\';
      FileName := 'lfax.ini';
      Filter := '*.ini';
      if Execute then
        Result := FileName
      else
        Abortar;
    end;
  IniFile.WriteString('lfax', 'configFile', Result);
  IniFile.Free;

  IniFile := TIniFile.Create(Result);
  Result := IniFile.ReadString('DadosInfoDriver', 'DiretorioCabLFax', '');
  if Result = '' then
  begin
    if (MessageDlg('Diretorio do LFax não encontrado.'+#13+#10+'Definir agora?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      Result := 'C:\LFax';
      if not InputQuery('Por favor, selecione o diretório para o LFax', 'Diretório', Result) then
        Abortar;
      Inifile.WriteString('DadosInfoDriver', 'DiretorioCabLFax', Result);
    end
    else
      Abortar;
  end;
end;

procedure TLFaxProvider.UpdateData;
begin
  //Atualizando dados do objeto Provider
  Buscador.Limpa;
  Buscador.Adiciona('DESC_LOGIN_LFAX', 'TB_USUARIO',
    'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
  Buscador.Adiciona('DESC_SENHA_LFAX', 'TB_USUARIO',
    'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
  Buscador.Adiciona('DESC_FILIAL', 'TB_FILIAL',
    'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));
  Buscador.Adiciona('NVL(DESC_FAX, DESC_TELEFONE)', 'TB_FILIAL',
    'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));
  Buscador.Adiciona('DESC_NOME_CONTATO', 'TB_FILIAL',
    'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));
  Buscador.Buscar();
  FLogin := Buscador.Proximo;
  FPassword := Buscador.Proximo;
  FFirm := Buscador.Proximo;
  FFirmPhone := Buscador.Proximo;
  FContact := Buscador.Proximo;
end;

constructor TLFaxProvider.Create;
begin
  FLogin := '';
  FPassword := '';
  FFirm := '';
  FFirmPhone := '';
  FContact := '';
  FSecondFaxNumber := '';
  FPriority := '';
  FFacePage := '';
  FSubject := '';
end;

procedure TLFaxProvider.Free;
begin
  inherited Free;
end;

function TFTParametro.GetTelaConsultaLFAXClass: TFormClass;
begin
  Result := nil;
  if Assigned(LFaxProvider) then
    Result := LFaxProvider.TelaConsultaLFAXClass;
end;

procedure TFTParametro.SetTelaConsultaLFAXClass(const Value: TFormClass);
begin
  LFaxProvider.TelaConsultaLFAXClass := Value;
end;

end.

