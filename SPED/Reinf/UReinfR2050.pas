unit UReinfR2050;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, UFmFilial, Grids, DBGrids, UReinf_cl, DBCtrls,
  UConsultaProcessoR1070, UOracle_cl, UUsuario_cl, UBiblioteca;

type
  TFReinfR2050 = class(TFTCadSimples)
    FmFilialR2050: TFmFilial;
    dbgR2050: TDBGrid;
    Label1: TLabel;
    dbeRecBrutaPer: TDBEdit;
    Label2: TLabel;
    dbeContriPrevApur: TDBEdit;
    Label3: TLabel;
    dbeContriPrevRAT: TDBEdit;
    Label4: TLabel;
    dbeContriSenar: TDBEdit;
    Label5: TLabel;
    dbeContriSuspe: TDBEdit;
    Label6: TLabel;
    dbeContriSenarSusp: TDBEdit;
    dbgTipoComercializacao: TDBGrid;
    dbgProcessos: TDBGrid;
    Label7: TLabel;
    Label8: TLabel;
    cbTipoComercializacao: TComboBox;
    btnAdicionaComer: TButton;
    btnRemoveComer: TButton;
    btnAdicionaProc: TButton;
    btnRemoveProc: TButton;
    Label9: TLabel;
    btnGerarEvento: TButton;
    dtpkPerApur: TDateTimePicker;
    Label10: TLabel;
    edtValRecBruta: TEdit;
    procedure LimparCampos;
    procedure AtivarDesativarCampos(Botao: TButton);
    procedure btnAdicionaComerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure btnAdicionaProcClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBRefreshClick(Sender: TObject);
    procedure dbgR2050CellClick(Column: TColumn);
    procedure btnRemoveProcClick(Sender: TObject);
    procedure btnRemoveComerClick(Sender: TObject);
    procedure dbgTipoComercializacaoCellClick(Column: TColumn);
    procedure edtValRecBrutaKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReinfR2050: TFReinfR2050;

implementation

uses UFilial_cl;

{$R *.dfm}

procedure TFReinfR2050.AtivarDesativarCampos(Botao: TButton);
var
  isAtivo: boolean;
begin
  isAtivo := (DSPrimario.State in [dsEdit, dsInsert]);
  //desativa a edição dos campos do formulário caso este não esteja em edição ou inserção
  FmFilialR2050.Enabled := isAtivo;
  dbeRecBrutaPer.Enabled := isAtivo;
  dbeContriPrevApur.Enabled := isAtivo;
  dbeContriPrevRAT.Enabled := isAtivo;
  dbeContriSenar.Enabled := isAtivo;
  dbeContriSuspe.Enabled := isAtivo;
  dbeContriSenarSusp.Enabled := isAtivo;
  edtValRecBruta.Enabled := isAtivo;
  btnAdicionaComer.Enabled := isAtivo;
  btnAdicionaProc.Enabled := isAtivo;
  btnRemoveComer.Enabled := isAtivo;
  btnRemoveProc.Enabled := isAtivo;
  dtpkPerApur.Enabled := isAtivo;
  dbgTipoComercializacao.Enabled := isAtivo;
  dbgProcessos.Enabled := isAtivo;
  cbTipoComercializacao.Enabled := isAtivo;

end;

procedure TFReinfR2050.LimparCampos;
begin

  FmFilialR2050.MeFilial.Clear;
  FmFilialR2050.EdFilial.Clear;
  dbeRecBrutaPer.Clear;
  dbeContriPrevApur.Clear;
  dbeContriPrevRAT.Clear;
  dbeContriSenar.Clear;
  dbeContriSuspe.Clear;
  dbeContriSenarSusp.Clear;
  dbgTipoComercializacao.DataSource.DataSet.Close;
  dbgTipoComercializacao.DataSource.DataSet.Open;
  dbgProcessos.Refresh;
  cbTipoComercializacao.Clear;
  edtValRecBruta.Clear;

end;
procedure TFReinfR2050.btnAdicionaComerClick(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin 
    if QReinfR2050.State in [dsInsert, dsEdit] then
    begin
      QComercializacaoR2050.Open;
      QComercializacaoR2050.Insert;
      QComercializacaoR2050COD_TABELA_REINF.Value := 'R-2050';
      QComercializacaoR2050COD_REGISTRO_REINF.Value := QReinfR2050COD_REINF_R2050.Value;
      QComercializacaoR2050IND_COMERCIALIZACAO.Value := StrToInt(Trim(Copy(cbTipoComercializacao.Items.Strings[cbTipoComercializacao.ItemIndex], 1,2)));
      QComercializacaoR2050VAL_REC_BRUTA.Value := StrToFloat(Trim(edtValRecBruta.Text));
      QComercializacaoR2050.Post;
      QComercializacaoR2050.Close; 
    end;
    QComercializacaoR2050Cons.Close;
    QComercializacaoR2050Cons.SetVariable('COD_REGISTRO_REINF', QReinfR2050COD_REINF_R2050.Value);
    QComercializacaoR2050Cons.Open;
    dbgTipoComercializacao.Refresh;
    edtValRecBruta.Clear;
    cbTipoComercializacao.Clear;

  end;
end;

procedure TFReinfR2050.FormCreate(Sender: TObject);
begin
  with DMReinf do
  begin
    QReinfR2050.Open;
    FmFilialR2050.MeFilial.Text := QReinfR2050COD_FILIAL.Text;
    QReinfR2050Cons.Open;
    QComercializacaoR2050.Close;
    QComercializacaoR2050Cons.Close;
    QComercializacaoR2050Cons.SetVariable('COD_REGISTRO_REINF', QReinfR2050COD_REINF_R2050.Value);
    QComercializacaoR2050Cons.Open;
    QTipoComerXR1070Cons.Close;
    QTipoComerXR1070Cons.SetVariable('COD_TIPO_COMERCIALIZACAO', QComercializacaoR2050ConsCOD_TIPO_COMERCIALIZACAO.Value);
    QTipoComerXR1070Cons.Open;
    QTipoComerXR1070.Open;
  end;
  inherited;

  AtivarDesativarCampos(TButton(SBConfirmar));
end;

procedure TFReinfR2050.SBConfirmarClick(Sender: TObject);
begin

  with DMReinf do
  begin
    QReinfR2050COD_FILIAL.Value := StrToInt(Trim(FmFilialR2050.MeFilial.Text));
    QReinfR2050DT_PERIODO_APURACAO.Value := dtpkPerApur.DateTime;
    QReinfR2050COD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  end;
  inherited;
  dbgR2050.Refresh;
  dbgTipoComercializacao.Refresh;
  dbgProcessos.Refresh;
  AtivarDesativarCampos(TButton(Sender));
end;

procedure TFReinfR2050.btnAdicionaProcClick(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    if QReinfR2050.State in [dsInsert, dsEdit] then
    begin
      if FConsultaProcessoR1070 = nil then
        FConsultaProcessoR1070 := TFConsultaProcessoR1070.Create(Application);
      FConsultaProcessoR1070.ShowModal;
      if FConsultaProcessoR1070.ModalResult = mrOK then
      begin
        if QProcessoR1070Cons.RecordCount > 0 then
        begin
          QTipoComerXR1070.Open;
          QTipoComerXR1070.Insert;
          QTipoComerXR1070COD_TIPO_COMERCIALIZACAO.Value := QComercializacaoR2050ConsCOD_TIPO_COMERCIALIZACAO.Value;
          QTipoComerXR1070COD_REINF_R1070.Value := QProcessoR1070ConsCOD_REINF_R1070.Value;
          QTipoComerXR1070.Post;
        end;
      end;
      QTipoComerXR1070Cons.Close;
      QTipoComerXR1070Cons.SetVariable('COD_TIPO_COMERCIALIZACAO', QComercializacaoR2050ConsCOD_TIPO_COMERCIALIZACAO.Value);
      QTipoComerXR1070Cons.Open;
      dbgProcessos.Refresh;
    end;
  end;


end;

procedure TFReinfR2050.SBIncluirClick(Sender: TObject);
begin
  inherited;
  AtivarDesativarCampos(TButton(SBIncluir));
end;

procedure TFReinfR2050.SBExcluirClick(Sender: TObject);
begin

  with DMOracle, DMReinf do
  begin

    if (BuscaNome('SELECT COUNT(COD_REINF_PERIODO) FROM TB_REINF_PERIODO', 'DESC_EVENTO_REINF = ' +
                  QuotedStr('R-2050') +  ' AND COD_REINF_PERIODO = ' + QReinfR2050COD_REINF_R2050.Text) = '0') then
    begin
      if Dialogs.MessageDlg('Isso excluirá todas as informações. Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        with DMReinf, DMOracle do
        begin
          QComercializacaoR2050Cons.First;
          while not QComercializacaoR2050Cons.Eof do
          begin
            btnRemoveComerClick(Self);
            QComercializacaoR2050Cons.Next;
          end;
          ExecutaSql(MontaDelete('TB_TIPO_COMERCIALIZACAO_REINF', 'COD_TABELA_REINF = '+ QuotedStr('R-2050') +
                                                                  ' AND COD_REGISTRO_REINF = ' + QReinfR2050COD_REINF_R2050.Text), true);
        end;
        inherited;
        dbgR2050.DataSource.DataSet.Refresh;
        dbgProcessos.DataSource.DataSet.Refresh;
        dbgTipoComercializacao.DataSource.DataSet.Refresh;
      end
      else
        ShowMessage('Cancelado pelo usuário');
        
    end
    else
      Raise Exception.Create('Já existe evento gerado para envio. Exclua os eventos não enviados para poder alterá-los.');
  end;
  
end;

procedure TFReinfR2050.SBAlterarClick(Sender: TObject);
begin
  inherited;
  AtivarDesativarCampos(TButton(Sender));
end;

procedure TFReinfR2050.SBCancelarClick(Sender: TObject);
begin
  with DMReinf do
  begin
    QTipoComerXR1070.Cancel;
    QComercializacaoR2050.Cancel;
  end;
  dbgTipoComercializacao.Refresh;
  dbgProcessos.Refresh;
  inherited;
  LimparCampos;
  AtivarDesativarCampos(TButton(Sender));
end;

procedure TFReinfR2050.SBRefreshClick(Sender: TObject);
begin
  dbgTipoComercializacao.Refresh;
  dbgProcessos.Refresh;
  dbgProcessos.Refresh;
  inherited;
  AtivarDesativarCampos(TButton(Sender));
end;

procedure TFReinfR2050.dbgR2050CellClick(Column: TColumn);
begin
  inherited;
  with DMReinf do
  begin
    if QReinfR2050Cons.State in [dsBrowse] then
    begin
      QReinfR2050.Close;
      QReinfR2050.SetVariable('PK', QReinfR2050ConsCOD_REINF_R2050.Value);
      QReinfR2050.Open;
    end;
    QComercializacaoR2050Cons.Close;
    QComercializacaoR2050Cons.SetVariable('COD_REGISTRO_REINF', QReinfR2050ConsCOD_REINF_R2050.Value);
    QComercializacaoR2050Cons.Open;
    QTipoComerXR1070Cons.Close;
    QTipoComerXR1070Cons.SetVariable('COD_TIPO_COMERCIALIZACAO', QComercializacaoR2050ConsCOD_TIPO_COMERCIALIZACAO.Value);
    QTipoComerXR1070Cons.Open;
  end;
end;

procedure TFReinfR2050.btnRemoveProcClick(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    if (QReinfR2050.State in [dsEdit, dsInsert]) and (QTipoComerXR1070.State in [dsBrowse]) then
    begin
      if QTipoComerXR1070.RecordCount <> 0 then
        QTipoComerXR1070.Delete;
    end;
    dbgProcessos.DataSource.DataSet.Refresh;
    dbgProcessos.Refresh;
  end;
end;

procedure TFReinfR2050.btnRemoveComerClick(Sender: TObject);
begin
  inherited;
  with DMReinf, DMOracle do
  begin
    if (QReinfR2050.State in [dsEdit, dsInsert]) and (QComercializacaoR2050Cons.State in [dsBrowse]) then
    begin
      if QTipoComerXR1070Cons.RecordCount > 0 then
      begin
        ExecutaSql(MontaDelete('TB_TIPO_COMER_X_R1070', 'COD_TIPO_COMERCIALICACAO = ' +
                              QTipoComerXR1070ConsCOD_TIPO_COMERCIALICACAO.Text), true);
      end;
      QTipoComerXR1070.Open;
      QComercializacaoR2050.SetVariable('PK', QComercializacaoR2050ConsCOD_TIPO_COMERCIALIZACAO.Value);
      QComercializacaoR2050.Open;
      QComercializacaoR2050.Delete;
      QComercializacaoR2050.Refresh;
      QTipoComerXR1070.Refresh;
      QTipoComerXR1070Cons.Refresh;
      QComercializacaoR2050Cons.Refresh;
    end;                           
    dbgProcessos.Refresh;
    dbgTipoComercializacao.Refresh;
  end;                  
end;

procedure TFReinfR2050.dbgTipoComercializacaoCellClick(Column: TColumn);
begin
  inherited;
  with DMReinf do
  begin
    QTipoComerXR1070Cons.Close;
    QTipoComerXR1070Cons.SetVariable('COD_TIPO_COMERCIALIZACAO', QComercializacaoR2050ConsCOD_TIPO_COMERCIALIZACAO.Value);
    QTipoComerXR1070Cons.Open;
  end;
  dbgProcessos.Refresh;


end;

procedure TFReinfR2050.edtValRecBrutaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Bib = nil then
    Bib := TBib.Create;

  Key := bib.SomenteNumero(Key, edtValRecBruta.Text, true);
end;

end.
