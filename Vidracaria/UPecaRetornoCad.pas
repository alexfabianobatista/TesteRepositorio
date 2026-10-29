unit UPecaRetornoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBPanel, DBCtrls, DBDirceu, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFPecaRetornoCad = class(TFTCadSimples)
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel3: TDBPanel;
    GBCodBarras: TGroupBox;
    MECodBarras: TMaskEdit;
    PeasdeRetorno1: TMenuItem;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Opes1: TMenuItem;
    BaixarPea1: TMenuItem;
    DBRPeca_situacao: TDBRadioGroup;
    DevolverPea1: TMenuItem;
    PeaaRetornar1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure MECodBarrasChange(Sender: TObject);
    procedure MECodBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure PeasdeRetorno1Click(Sender: TObject);
    procedure BaixarPea1Click(Sender: TObject);
    procedure DevolverPea1Click(Sender: TObject);
    procedure PeaaRetornar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPecaRetornoCad: TFPecaRetornoCad;

implementation

uses UPecaRetorno_cl, UPecaRetornoCons, UPecaRetornoParam, URPecaRetorno,
  UBiblioteca, UFmProduto, UProdutoCons, UProduto_cl, UOracle_cl;

{$R *.dfm}

procedure TFPecaRetornoCad.FormCreate(Sender: TObject);
begin
  inherited;
  with DMPecaRetorno do
  begin
    QPecaRetorno.Close;
    QPecaRetorno.Open;
  end;
end;

procedure TFPecaRetornoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FPecaRetornoCons = nil then
    FPecaRetornoCons := TFPecaRetornoCons.Create(Application);
  if FPecaRetornoCons.ShowModal = MrOk then
    with DMPecaRetorno do
    begin
      QPecaRetorno.Close;
      QPecaRetorno.SetVariable('PK', QPecaRetornoConsCOD_PECA_RETORNO.Value);
      QPecaRetorno.Open;
    end;
end;

procedure TFPecaRetornoCad.MECodBarrasChange(Sender: TObject);
begin
  inherited;
  if Length(MECodBarras.Text) >= 12 then
  begin
    if not (DSPrimario.State in [DsEdit, DsInsert]) then
      SBIncluirClick(Sender);
    with DMPecaRetorno do
    begin
      QPecaRetornoCOD_PECA.Value := IntToStr(StrToInt(Copy(MECodBarras.Text, 1, 6))); //Removendo zeros nao significativos.
      QPecaRetornoNUM_SERIE.Value := StrToInt(Copy(MECodBarras.Text, 9, 3));
    end;
    try
      SBConfirmarClick(Sender);
    except on e: Exception do
      MessageDlg('Erro ao gravar Retorno. (' + e.Message + ')'+#13+#10+
        'Provavelmente esta etiqueta já foi retornada.', mtError, [mbOK], 0);
    end;
    MECodBarras.Text := '';
  end;
end;

procedure TFPecaRetornoCad.MECodBarrasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8, #13]) then
    Key := #0;
end;

procedure TFPecaRetornoCad.PeasdeRetorno1Click(Sender: TObject);
begin
  inherited;
  if FPecaRetornoParam = nil then
    FPecaRetornoParam := TFPecaRetornoParam.Create(Application);
  FPecaRetornoParam.AtivaPagina(0);
  if FPecaRetornoParam.ShowModal = MrOk then
    with DMPecaRetorno do
    begin
      QRPecaRetorno.Close;
      QRPecaRetorno.ClearVariables;
      if Trim(FPecaRetornoParam.Fm0Produto.MeProduto.Text) <> '' then
        QRPecaRetorno.SetVariable('PRODUTO', FPecaRetornoParam.Fm0Produto.MeProduto.Text);
      if Trim(FPecaRetornoParam.Fm0Cadastro.MeCadastro.Text) <> '' then
        QRPecaRetorno.SetVariable('CADASTRO', FPecaRetornoParam.Fm0Cadastro.MeCadastro.Text);
      if Trim(FPecaRetornoParam.Fm0Regiao.MeRegiao.Text) <> '' then
        QRPecaRetorno.SetVariable('REGIAO', FPecaRetornoParam.Fm0Regiao.MeRegiao.Text);
      if FPecaRetornoParam.Fm0Data.MeDtInicial.Text <> '' then
        QRPecaRetorno.SetVariable('DT_INICIO', FPecaRetornoParam.Fm0Data.MeDtInicial.Text);
      if FPecaRetornoParam.Fm0Data.MeDtFinal.Text <> '' then
        QRPecaRetorno.SetVariable('DT_FIM', FPecaRetornoParam.Fm0Data.MeDtFinal.Text);

      case FPecaRetornoParam.RGSituacaoPeca.ItemIndex of
        0 : QRPecaRetorno.SetVariable('IND_SITUACAO', 'R'); //Retornar
        1 : QRPecaRetorno.SetVariable('IND_SITUACAO', 'D'); //Devolvida
        2 : QRPecaRetorno.SetVariable('IND_SITUACAO', null);
      end;

      QRPecaRetorno.Open;

      if FRPecaRetorno = nil then
        FRPecaRetorno := TFRPecaRetorno.Create(Application);
      FRPecaRetorno.QRLData.Caption := Bib.DatasParaLabel(FPecaRetornoParam.Fm0Data.MeDtInicial.Text,
        FPecaRetornoParam.Fm0Data.MeDtFinal.Text);
      FRPecaRetorno.QrlParam.Caption := 'Cliente :'+ FPecaRetornoParam.Fm0Cadastro.EdCadastro.Text +
                                        '  Região:'+ FPecaRetornoParam.Fm0Regiao.EdRegiao.Text;
      FRPecaRetorno.QRLProduto.Caption := FPecaRetornoParam.Fm0Produto.EdProduto.Text;
      if FPecaRetornoParam.RGPreview.ItemIndex = 0 then
        FRPecaRetorno.QRPrimario.Preview
      else
        FRPecaRetorno.QRPrimario.Print;

      QRPecaRetorno.Close;
    end;
end;

procedure TFPecaRetornoCad.BaixarPea1Click(Sender: TObject);
Var
wPeca : String;
begin
  inherited;
  wPeca := InputBox('Peça', 'Digite o número da peça: ', '');
  if wPeca <> '' Then
  Begin
    DMOracle.ExecutaSql('DELETE FROM TB_PECA_RETORNO WHERE COD_PECA = ' + wPeca);
    ShowMessage('Peça Baixada com Sucesso!');
  end;
end;

procedure TFPecaRetornoCad.DevolverPea1Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente mudar a situação da Peça para DEVOLVIDA?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    With DMOracle do
    Begin
    try
      DBCemapa.StartTransaction;
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_PECA_RETORNO SET IND_SITUACAO = '+CHR(39)+'D'+CHR(39));
      QExecSQL.SQL.Add(' WHERE COD_PECA_RETORNO = '+trim(DMPecaRetorno.QPecaRetornoCOD_PECA_RETORNO.Text));
      QExecSQL.ExecSQL;
      DBCemapa.Commit;
      ShowMessage('OK! A peça foi alterada para situação DEVOLVIDA');
    except
      DBCemapa.Rollback;
      showmessage('É necessário consulta a Peça');
    end;
  end;
  DMPecaRetorno.QPecaRetorno.Refresh;
  end;
end;

procedure TFPecaRetornoCad.PeaaRetornar1Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente mudar a situação da Peça para RETORNAR?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    With DMOracle do
    Begin
    try
      DBCemapa.StartTransaction;
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_PECA_RETORNO SET IND_SITUACAO = '+CHR(39)+'R'+CHR(39));
      QExecSQL.SQL.Add(' WHERE COD_PECA_RETORNO = '+trim(DMPecaRetorno.QPecaRetornoCOD_PECA_RETORNO.Text));
      QExecSQL.ExecSQL;
      DBCemapa.Commit;
      ShowMessage('OK! A peça foi alterada para situação RETORNAR');
    except
      DBCemapa.Rollback;
      showmessage('É necessário consulta a Peça');
    end;
  end;
  DMPecaRetorno.QPecaRetorno.Refresh;
  end;
end;

end.
