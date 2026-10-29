unit URPedidosProntos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, Grids, DBGrids, ImgList, UFmDatas,
  ExtCtrls;

type
  TFRPedidosProntos = class(TForm)
    DBGrid1: TDBGrid;
    EdDescRegiao: TEdit;
    SBCodRegiao: TSpeedButton;
    MeCodRegiao: TMaskEdit;
    Label1: TLabel;
    MECodCadastro: TMaskEdit;
    SBCodCadastro: TSpeedButton;
    EdDescCadastro: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    ImageList1: TImageList;
    BitBtn2: TBitBtn;
    LPeso: TLabel;
    LValPeso: TLabel;
    FmDatas1: TFmDatas;
    RGPedidosProntos: TRadioGroup;
    procedure SBCodCadastroClick(Sender: TObject);
    procedure MECodCadastroExit(Sender: TObject);
    procedure SBCodRegiaoClick(Sender: TObject);
    procedure MeCodRegiaoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidosProntos: TFRPedidosProntos;
  wPeso : Real;

implementation

uses UEmbarque_cl, UCadastroCons, UOracle_cl, URegiaoCons, UCadastro_cl,
  URegiao_cl, UEmbarqueParam, UPedido_cl, DB;

{$R *.dfm}

procedure TFRPedidosProntos.SBCodCadastroClick(Sender: TObject);
begin
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    MECodCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
  MECodCadastroExit(self);

end;

procedure TFRPedidosProntos.MECodCadastroExit(Sender: TObject);
begin
  if Trim(MECodCadastro.Text) <> '' then
    EdDescCadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
      'COD_CADASTRO = ' + Trim(MECodCadastro.Text))
  else
    EdDescCadastro.Text := 'Todos';
end;

procedure TFRPedidosProntos.SBCodRegiaoClick(Sender: TObject);
begin
  if FRegiaoCons = nil then
    FRegiaoCons := TFRegiaoCons.Create(Application);
  if FRegiaoCons.ShowModal = mrOk then
    MECodRegiao.Text := DMRegiao.QRegiaoConsCod_Regiao.Text;
  MECodRegiaoExit(self);
end;

procedure TFRPedidosProntos.MeCodRegiaoExit(Sender: TObject);
begin
  if Trim(MECodRegiao.Text) <> '' then
    EdDescRegiao.Text := DMOracle.BuscaNome('SELECT DESC_REGIAO FROM TB_REGIAO',
      'COD_REGIAO = ' + Trim(MECodRegiao.Text))
  else
    EdDescRegiao.Text := 'Todas';
end;

procedure TFRPedidosProntos.BitBtn1Click(Sender: TObject);
begin
  DMEmbarque.QRPedidosProntos.Close;
  if Trim(FRPedidosProntos.MeCodRegiao.Text) <> '' then
    DMEmbarque.QRPedidosProntos.SetVariable('COD_REGIAO', MeCodRegiao.Text)
  else
    raise Exception.Create('É Preciso Informa a Região!!');
  if Trim(FRPedidosProntos.MECodCadastro.Text) <> '' then
    DMEmbarque.QRPedidosProntos.SetVariable('COD_CADASTRO', MECodCadastro.Text)
  else
    DMEmbarque.QRPedidosProntos.SetVariable('COD_CADASTRO', NULL);
  DMEmbarque.QRPedidosProntos.SetVariable('NUM_PALM', NULL);
  if (FmDatas1.MeDtInicial.Text = '') then
    DMEmbarque.QRPedidosProntos.SetVariable('DT_INICIAL', NULL)
  else
    DMEmbarque.QRPedidosProntos.SetVariable('DT_INICIAL', trim(fmDatas1.MeDtInicial.Text));

  If (FmDatas1.MeDtFinal.Text = '') then
    DMEmbarque.QRPedidosProntos.SetVariable('DT_FINAL', NULL)
  else
    DMEmbarque.QRPedidosProntos.SetVariable('DT_FINAL', trim(fmDatas1.MeDtFinal.Text));

  if RGPedidosProntos.ItemIndex = 0 then
    DMEmbarque.QRPedidosProntos.SetVariable('PEDIDOS_PRONTOS', 'SIM')
  else
    DMEmbarque.QRPedidosProntos.SetVariable('PEDIDOS_PRONTOS', 'NAO');

  DMEmbarque.QRPedidosProntos.Open;
  wPeso := 0; 
end;

procedure TFRPedidosProntos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Column.Title.Caption = 'X') then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    if DMEmbarque.QRPedidosProntosNUM_PALM.Value = 0 then
      ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 3)
    else
      ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 2);
  end;
end;

procedure TFRPedidosProntos.DBGrid1CellClick(Column: TColumn);
var
  wRecNo: integer;

begin
  wPeso := StrToFloat(LValPeso.Caption);
  if Column.Title.Caption = 'X' then
  begin
    wRecNo := DMEmbarque.QRPedidosProntos.RecNo;

    if DMEmbarque.QRPedidosProntosNUM_PALM.Value = 0 then
    begin
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_CAB SET NUM_PALM = 1 WHERE COD_PEDIDO_CAB=' + DMEmbarque.QRPedidosProntosCOD_PEDIDO_CAB.Text);
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
      DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1;

      wPeso := wPeso + DMEmbarque.QRPedidosProntosval_peso.Value;
      LValPeso.Caption := FloatToStr(wPeso);
    end
    else if DMEmbarque.QRPedidosProntosNUM_PALM.Value = 1 then
    begin
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_CAB SET NUM_PALM = 0 WHERE COD_PEDIDO_CAB=' + DMEmbarque.QRPedidosProntosCOD_PEDIDO_CAB.Text);
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
      DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1;
      if StrToFloat(LValPeso.Caption) <> 0 then
        wPeso := wPeso - DMEmbarque.QRPedidosProntosval_peso.Value;
      LValPeso.Caption := FloatToStr(wPeso);
    end;
  end;
  DMEmbarque.QRPedidosProntos.Close;
  if Trim(FRPedidosProntos.MeCodRegiao.Text) <> '' then
    DMEmbarque.QRPedidosProntos.SetVariable('COD_REGIAO', MeCodRegiao.Text)
  else
    raise Exception.Create('É Preciso Informa a Região!!');
  if Trim(FRPedidosProntos.MECodCadastro.Text) <> '' then
    DMEmbarque.QRPedidosProntos.SetVariable('COD_CADASTRO', MECodCadastro.Text)
  else
    DMEmbarque.QRPedidosProntos.SetVariable('COD_CADASTRO', NULL);
  DMEmbarque.QRPedidosProntos.SetVariable('NUM_PALM', NULL);
  DMEmbarque.QRPedidosProntos.Open;
  DMEmbarque.QRPedidosProntos.RecNo := wRecNo;
end;

procedure TFRPedidosProntos.BitBtn2Click(Sender: TObject);
var
  wEmbarque: string;
  wSequencia: integer;
begin
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[20].TabVisible := True;

  if FEmbarqueParam.ShowModal = mrOk then
  begin
    if Trim(FEmbarqueParam.ME21DtEmbarque.Text) = '' then
      raise Exception.Create('Informe a data do Embarque!');
    if Trim(FEmbarqueParam.Ed21Motorista.Text) = '' then
      raise Exception.Create('Informe o Motorista!');

    DMEmbarque.QRPedidosProntos.Close;
    DMEmbarque.QRPedidosProntos.SetVariable('COD_REGIAO', NULL);
    DMEmbarque.QRPedidosProntos.SetVariable('COD_CADASTRO', NULL);
    ;
    DMEmbarque.QRPedidosProntos.SetVariable('NUM_PALM', 1);
    DMEmbarque.QRPedidosProntos.Open;
    DMEmbarque.QRPedidosProntos.First;

    while not DMEmbarque.QRPedidosProntos.Eof do
    begin
      if DMEmbarque.QRPedidosProntosCod_Pedido_Cab.Text <> '' then
        if DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_EMBARQUE_ITEM',
          'COD_PEDIDO_CAB = ' +
          DMEmbarque.QRPedidosProntosCod_Pedido_Cab.Text) <> '' then
          raise Exception.Create('Pedido Nº ' +
            DMEmbarque.QRPedidosProntosCod_Pedido_Cab.Text +
            ' já utilizado em outro embarque');
      DMEmbarque.QRPedidosProntos.Next;
    end;

    DMEmbarque.QRPedidosProntos.First;
    wSequencia := 1;
    wEmbarque := DMOracle.BuscaNome('SELECT SQEMBARQUE.NEXTVAL FROM DUAL',
      '1=1');
    DMOracle.ExecutaSql(
      'INSERT INTO TB_EMBARQUE(COD_EMBARQUE,DT_EMBARQUE, NOME_MOTORISTA,COD_TRANSPORTADOR,DESC_PLACA) ' +
      'VALUES(' + wEmbarque + ',' + chr(39) + FEmbarqueParam.ME21DtEmbarque.Text
        + chr(39) + ',' + chr(39) + FEmbarqueParam.Ed21Motorista.Text + chr(39) +
        ', ' +
      chr(39) + FEmbarqueParam.FmCadastro21.MeCadastro.Text + chr(39) + ',' +
        chr(39) + FEmbarqueParam.Ed21Placa.Text + chr(39) + ')');

    while not DMEmbarque.QRPedidosProntos.Eof do
    begin
      DMOracle.ExecutaSql('INSERT INTO TB_EMBARQUE_ITEM(COD_EMBARQUE,COD_PEDIDO_CAB,NUM_SEQUENCIAL) ' +
        'VALUES(' + wEmbarque + ',' + chr(39) +
          DMEmbarque.QRPedidosProntosCOD_PEDIDO_CAB.Text + chr(39) + ',' +
          IntToStr(wSequencia) + ')');
      inc(wSequencia);
      DMEmbarque.QRPedidosProntos.Next;
    end;
    DMOracle.ExecutaSql('UPDATE TB_PEDIDO_CAB SET NUM_PALM = 0 WHERE NUM_PALM = 1');
    LValPeso.Caption := '0';
    ShowMessage('OK! Embarque Gerado Código' + wEmbarque);
  end;
end;

end.
