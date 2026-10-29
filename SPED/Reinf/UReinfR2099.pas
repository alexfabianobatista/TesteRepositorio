unit UReinfR2099;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBCtrls, UFmFilial, UFmCadastro, Grids, DBGrids,
  UBibSped;

type
  TFReinfR2099 = class(TFTCadSimples)
    GroupBox1: TGroupBox;
    dbcbR2010: TDBCheckBox;
    dbcbR2020: TDBCheckBox;
    dbcbR2030: TDBCheckBox;
    dbcbR2040: TDBCheckBox;
    dbcbR2050: TDBCheckBox;
    dbcbR2055: TDBCheckBox;
    dbcbR2060: TDBCheckBox;
    dbcbPagamentos: TDBCheckBox;
    FmCadastroR2099: TFmCadastro;
    FmFilialR2099: TFmFilial;
    Label7: TLabel;
    dtpkDataApuracao: TDateTimePicker;
    dbgReinfR2099: TDBGrid;
    Label1: TLabel;
    btnGerarEvento: TButton;
    DBEdit1: TDBEdit;
    procedure LimparCampos;
    procedure AtivarDesativarCampos(Botao: TButton);
    procedure DefineEventosNaoEnviados;  
    procedure FormActivate(Sender: TObject);
    procedure dbgReinfR2099CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure FmCadastroR2099MeCadastroExit(Sender: TObject);
    procedure btnGerarEventoClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure FmFilialR2099BtFilialClick(Sender: TObject);
    procedure FmFilialR2099MeFilialExit(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReinfR2099: TFReinfR2099;
  BibSped: TBibSped;

implementation

uses UReinf_cl, UFilialCons, UFilial_cl, UCadastro_cl, DateUtils,
  UOracle_cl, UGeraXMLReinf, UUsuario_cl;

{$R *.dfm}

procedure TFReinfR2099.FormActivate(Sender: TObject);
begin
  inherited;
  if not dbgReinfR2099.DataSource.DataSet.IsEmpty then
    dbgReinfR2099CellClick(dbgReinfR2099.Columns.Items[1]);
end;

procedure TFReinfR2099.dbgReinfR2099CellClick(Column: TColumn);
begin
  inherited;
  with DMReinf do
  begin
    if (QReinfR2099.State in [dsBrowse]) then
    begin
      QReinfR2099.Close;
      QReinfR2099.SetVariable('PK', dbgReinfR2099.DataSource.DataSet.FieldByName('COD_REINF_R2099').Value);
      QReinfR2099.Open;

      FmFilialR2099.MeFilial.Text := QReinfR2099COD_FILIAL.Text;
      FmFilialR2099.MeFilialExit(Self);
      FmCadastroR2099.MeCadastro.Text := QReinfR2099COD_CADASTRO.Text;
      FmCadastroR2099.MeCadastroExit(Self);
      dtpkDataApuracao.Date := QReinfR2099DT_PERIODO_APURACAO.AsDateTime;

    end
    else
      Raise Exception.Create('Os dados não puderam ser abertos! Cancele a operação anterior.');
  end;
  AtivarDesativarCampos(TButton(SBConfirmar));
  inherited;

end;

procedure TFReinfR2099.LimparCampos;
begin

  if BibSped = nil then
    BibSped := tBibSped.Create;

  dbcbR2010.Checked := false;
  dbcbR2020.Checked := false;
  dbcbR2030.Checked := false;
  dbcbR2040.Checked := false;
  dbcbR2050.Checked := false;
  dbcbR2055.Checked := false;
  dbcbR2060.Checked := false;
  dbcbPagamentos.Checked := false;
  FmCadastroR2099.MeCadastro.Clear;
  FmCadastroR2099.MeCadastroExit(Self);
  FmFilialR2099.MeFilial.Clear;
  FmFilialR2099.MeFilialExit(Self);
  dtpkDataApuracao.DateTime := BibSped.GetDateInDateTime(Now);

end;

procedure TFReinfR2099.AtivarDesativarCampos(Botao: TButton);
var
  isAtivo: boolean;
begin
  isAtivo := (DSPrimario.State in [dsEdit, dsInsert]);

  //desativa a edição dos campos do formulário caso este não esteja em edição ou inserção
  dbcbR2010.Enabled := isAtivo;
  dbcbR2020.Enabled := isAtivo;
  dbcbR2030.Enabled := isAtivo;
  dbcbR2040.Enabled := isAtivo;
  dbcbR2050.Enabled := isAtivo;
  dbcbR2055.Enabled := isAtivo;
  dbcbR2060.Enabled := isAtivo;
  dbcbPagamentos.Enabled := isAtivo;
  FmCadastroR2099.MeCadastro.Enabled := isAtivo;
  FmCadastroR2099.BtCadastro.Enabled := isAtivo;
  FmFilialR2099.Enabled := isAtivo;
  FmFilialR2099.MeFilial.Enabled := isAtivo;
  FmFilialR2099.BtFilial.Enabled := isAtivo;
  dtpkDataApuracao.Enabled := isAtivo;
  
end;

procedure TFReinfR2099.FormCreate(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    QReinfR2099.Open;
    
    QReinfR2099Cons.Open;
  end;
  dtpkDataApuracao.DateTime := Today;
  AtivarDesativarCampos(TButton(SBConfirmar));
end;

procedure TFReinfR2099.SBIncluirClick(Sender: TObject);
begin
  Inherited;
  DefineEventosNaoEnviados;
  LimparCampos;
  AtivarDesativarCampos(TButton(Sender));
  DMReinf.QReinfR2099COD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TFReinfR2099.SBAlterarClick(Sender: TObject);
begin

  with DMReinf do
  begin
    QReinfR2099.Close;
    QReinfR2099.SetVariable('PK', dbgReinfR2099.DataSource.DataSet.FieldByName('COD_REINF_R2099').Value);
    QReinfR2099.Open;

    FmFilialR2099.MeFilial.Text := QReinfR2099COD_FILIAL.Text;
    FmFilialR2099.MeFilialExit(Self);
    FmCadastroR2099.MeCadastro.Text := QReinfR2099COD_CADASTRO.Text;
    FmCadastroR2099.MeCadastroExit(Self);
    dtpkDataApuracao.DateTime := QReinfR2099DT_PERIODO_APURACAO.Value;
  end;
  inherited;
  AtivarDesativarCampos(TButton(Sender));
end;

procedure TFReinfR2099.FmCadastroR2099MeCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(FmCadastroR2099.MeCadastro.Text) <> '' then
  begin
    with DMCadastro, DMReinf do
    begin
      QCadastro.Close;
      QCadastro.SetVariable('PK', StrToInt(Trim(FmCadastroR2099.MeCadastro.Text)));
      QCadastro.Open;
      QReinfR2099COD_CADASTRO.Value := QCadastroCOD_CADASTRO.Value;
      FmCadastroR2099.MeCadastro.Text := QCadastroCOD_CADASTRO.Text;
      FmCadastroR2099.EdCadastro.Text := QCadastroNOME.Text;
    end;
  end;
end;

procedure TFReinfR2099.btnGerarEventoClick(Sender: TObject);
var
  GeraXML: TGeraXMLReinf;
begin
  inherited;
  if GeraXML = nil then
    GeraXML := TGeraXMLReinf.Create;

  with DMReinf, DMOracle do
  begin

    // verifica se a query do evento está aberta
    if not (QReinfR2099.State in [dsBrowse]) then
      raise Exception.Create('Não foi possível realizar a geração. O registro deve estar salvo!')
    else
    begin
      if (BuscaNome('SELECT COUNT(COD_REINF_PERIODO) FROM TB_REINF_PERIODO', 'DESC_EVENTO_REINF = ' +
                  QuotedStr('R-2099') +  ' AND COD_EVENTO_REINF = ' + QReinfR2099COD_REINF_R2099.Text) = '0') then
      begin
        // verifica se o evento está selecionado
        if Trim(QReinfR2099COD_REINF_R2099.Text) = '' then
          raise Exception.Create('Deve haver um registro selecionado para geração.')
        else
          GeraXML.GerarR2099(QReinfR2099COD_REINF_R2099.Value, 'R-2099', '1.05.01');
      end
      else
        raise Exception.Create('Este evento já foi gerado!');
    end;
    QReinfPeriodo.Refresh;
  end;

end;

procedure TFReinfR2099.SBConfirmarClick(Sender: TObject);
begin

  with DMReinf do
  begin
    QReinfR2099COD_FILIAL.Text := trim(FmFilialR2099.MeFilial.Text);
    QReinfR2099COD_CADASTRO.Text := trim(FmCadastroR2099.MeCadastro.Text);
    QReinfR2099DT_PERIODO_APURACAO.Value := dtpkDataApuracao.DateTime;
    QReinfR2099IND_PRODUCAO_HOMOLOGACAO.Value := DMFilial.QFilialIND_AMBIENTE_REINF.Value;
    QReinfR2099COD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  end;

  inherited;

  LimparCampos;
  AtivarDesativarCampos(TButton(Sender));
  dbgReinfR2099.DataSource.DataSet.Refresh;

end;

procedure TFReinfR2099.FmFilialR2099BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
  begin
    with DMFilial, DMReinf do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', QFilialConsCod_Filial.Value);
      QFilial.Open;
      QReinfR2099COD_FILIAL.Value := QFilialCOD_FILIAL.Value;
      FmFilialR2099.MeFilial.Text := QFilialCOD_FILIAL.Text;
      FmFilialR2099.EdFilial.Text := QFilialDESC_FILIAL.Text;

      if QFilialCOD_CADASTRO_REINF.Text <> '' then
        FmCadastroR2099.MeCadastro.Text := QFilialCOD_CADASTRO_REINF.Text;

      if (QFilialCOD_CADASTRO_REINF.Text <> '') and (QFilialCOD_CADASTRO_REINF.Value > 0) then
      begin
        FmCadastroR2099MeCadastroExit(Self);
      end;
    end;
  end;
end;

procedure TFReinfR2099.FmFilialR2099MeFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(FmFilialR2099.MeFilial.Text) <> '' then
  begin
    with DMFilial, DMReinf do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', StrToInt(Trim(FmFilialR2099.MeFilial.Text)));
      QFilial.Open;
      QReinfR2099COD_FILIAL.Value := QFilialCOD_FILIAL.Value;
      FmFilialR2099.MeFilial.Text := QFilialCOD_FILIAL.Text;
      FmFilialR2099.EdFilial.Text := QFilialDESC_FILIAL.Text;

      if QFilialCOD_CADASTRO_REINF.Text <> '' then
      begin
        FmCadastroR2099.MeCadastro.Text := QFilialCOD_CADASTRO_REINF.Text;
        FmCadastroR2099.MeCadastroExit(Self);
        
      end;
    end;
  end;
end;

procedure TFReinfR2099.SBExcluirClick(Sender: TObject);
begin
  inherited;
   with DMOracle, DMReinf do
  begin

    if (BuscaNome('SELECT COUNT(COD_REINF_PERIODO) FROM TB_REINF_PERIODO', 'DESC_EVENTO_REINF = ' +
                  QuotedStr('R-2099') +  ' AND COD_EVENTO_REINF = ' + QReinfR2099COD_REINF_R2099.Text) = '0') then
    begin
      if Dialogs.MessageDlg('Isso excluirá todas as informações. Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        inherited;
        dbgReinfR2099.DataSource.DataSet.Refresh;
        AtivarDesativarCampos(TButton(Sender));
      end
      else
        ShowMessage('Cancelado pelo usuário');
    end
    else
      Raise Exception.Create('Já existe evento gerado para envio. Exclua os eventos não enviados para poder alterá-los.');

  end;

end;

procedure TFReinfR2099.SBCancelarClick(Sender: TObject);
begin
  inherited;
  AtivarDesativarCampos(TButton(Sender));
end;

procedure TFReinfR2099.DefineEventosNaoEnviados;
begin

  with DMReinf do
  begin

    QReinfR2099IND_EVT_R2010.Value := 'N';
    QReinfR2099IND_EVT_R2020.Value := 'N';
    QReinfR2099IND_EVT_R2030.Value := 'N';
    QReinfR2099IND_EVT_R2040.Value := 'N';
    QReinfR2099IND_EVT_R2050.Value := 'N';
    QReinfR2099IND_EVT_R2055.Value := 'N';
    QReinfR2099IND_EVT_R2060.Value := 'N';

  end;

end;

end.
