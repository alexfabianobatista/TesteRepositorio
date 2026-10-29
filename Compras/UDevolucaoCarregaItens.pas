unit UDevolucaoCarregaItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ImgList, DBClient,
  Provider, Mask;

type
  TFDevolucaoCarregaItens = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    DsItensDevolucao: TDataSource;
    BitBtn1: TBitBtn;
    ImageList1: TImageList;
    BtnTodos: TBitBtn;
    DspItensDevolucao: TDataSetProvider;
    CdItensDevolucao: TClientDataSet;
    CdItensDevolucaoCOD_NOTA_ITEM: TIntegerField;
    CdItensDevolucaoCOD_NOTA_CAB: TIntegerField;
    CdItensDevolucaoCOD_TRIBUTACAO: TIntegerField;
    CdItensDevolucaoQT_QUANTIDADE: TFloatField;
    CdItensDevolucaoVAL_TOTAL: TFloatField;
    CdItensDevolucaoPERC_IPI: TFloatField;
    CdItensDevolucaoPERC_COMISSAO: TFloatField;
    CdItensDevolucaoCOD_PRODUTO: TFloatField;
    CdItensDevolucaoCOD_LOTE_TIPO: TIntegerField;
    CdItensDevolucaoVAL_DESCONTO: TFloatField;
    CdItensDevolucaoVAL_DESPESAS: TFloatField;
    CdItensDevolucaoVAL_FRETE: TFloatField;
    CdItensDevolucaoPERC_DESCONTO: TFloatField;
    CdItensDevolucaoVAL_IPI: TFloatField;
    CdItensDevolucaoVAL_UNITARIO: TFloatField;
    CdItensDevolucaoVAL_ICM_BASE: TFloatField;
    CdItensDevolucaoVAL_ICM: TFloatField;
    CdItensDevolucaoIND_CLASS_IPI: TStringField;
    CdItensDevolucaoVAL_CUSTO: TFloatField;
    CdItensDevolucaoVAL_ISS: TFloatField;
    CdItensDevolucaoPERC_INSS: TFloatField;
    CdItensDevolucaoPERC_BENEFICIADO: TFloatField;
    CdItensDevolucaoIND_BX_CONTR_VEND: TStringField;
    CdItensDevolucaoNUM_NOTA_PRODUTOR: TIntegerField;
    CdItensDevolucaoCOD_CULTURA: TIntegerField;
    CdItensDevolucaoDESC_PRODUTO: TStringField;
    CdItensDevolucaoIND_TIPO_CONSUMO: TStringField;
    CdItensDevolucaoQT_CHEGADA: TFloatField;
    CdItensDevolucaoVAL_PIS: TFloatField;
    CdItensDevolucaoVAL_CONFINS: TFloatField;
    CdItensDevolucaoPERC_DESC: TFloatField;
    CdItensDevolucaoVAL_BASE_SUBST: TFloatField;
    CdItensDevolucaoVAL_ICMS_SUBST: TFloatField;
    CdItensDevolucaoVAL_UNITARIO_TABELA: TFloatField;
    CdItensDevolucaoVAL_DPI_TRANSGENICOS: TFloatField;
    CdItensDevolucaoQT_CREDITO_TRANSGENICOS: TFloatField;
    CdItensDevolucaoCOD_ROMANEIO_AGRICOLA: TIntegerField;
    CdItensDevolucaoIND_TIPO_PRODUTO: TStringField;
    CdItensDevolucaoDESC_COMPLEMENTO: TStringField;
    CdItensDevolucaoIND_MARCADO: TStringField;
    CdItensDevolucaoVAL_DESCONTO_RATEIO: TFloatField;
    CdItensDevolucaoNUM_FABRICANTE: TStringField;
    MECodigoBarras: TMaskEdit;
    CdItensDevolucaoIND_MODIFICADO: TStringField;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BtnTodosClick(Sender: TObject);
    procedure CdItensDevolucaoAfterOpen(DataSet: TDataSet);
    procedure CdItensDevolucaoIND_MARCADOChange(Sender: TField);
    procedure MECodigoBarrasExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    BotaoMarcarClicado: boolean;
    wRepetido: Integer;
    procedure todos(acao: boolean);
    { Private declarations }
  public
    countSelecionados: Integer;
    function carrega(nota: Integer): Integer;
    procedure MECodigoBarrasMODASUL;
    procedure MECodigoBarrasJASOL;
    procedure MECodigoBarrasDONNA;
    procedure MECodigoBarrasELSHADAY;
    procedure MECodigoBarrasPILILICOS;
    procedure MECodigoBarrasNormal;
    { Public declarations }
  end;

var
  FDevolucaoCarregaItens: TFDevolucaoCarregaItens;

implementation

uses UNotaSaida_cl, UBiblioteca, UParamSistema_cl;

{$R *.dfm}

function TFDevolucaoCarregaItens.carrega(nota: Integer): Integer;
begin
  CdItensDevolucao.Close;
  CdItensDevolucao.Params.ParamByName('COD_NOTA_CAB').AsInteger := nota;
//  DMNotaSaida.QItensDevolucao.SetVariable('COD_NOTA_CAB', nota);
  CdItensDevolucao.Open;
  CdItensDevolucao.First;

  BtnTodos.Caption := 'Marcar Todos';
  Result := ShowModal;
end;

procedure TFDevolucaoCarregaItens.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Column.Title.Caption = ' ') then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    if CdItensDevolucaoIND_MARCADO.Value = 'S' then
      ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 0)
    else
      ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 1);
  end;
end;

procedure TFDevolucaoCarregaItens.DBGrid1CellClick(Column: TColumn);
begin
  if Column.Title.Caption = ' ' then
  begin
    CdItensDevolucao.Edit;
    if ((DMParamSistema.CodEmpresa = 'MODASUL')
        or (DMParamSistema.CodEmpresa = 'JASOL') or
           (DMParamSistema.CodEmpresa = 'DONNA') or
           (DMParamSistema.CodEmpresa = 'NFCE-SHADA') or
            (DMParamSistema.CodEmpresa = 'PILILICOS')   )
        and (MECodigoBarras.Visible) and
      not BotaoMarcarClicado then
    begin
      if CdItensDevolucaoQT_QUANTIDADE.Value > 0 then
      begin
        CdItensDevolucaoQT_QUANTIDADE.Value := CdItensDevolucaoQT_QUANTIDADE.Value - 1;
        CdItensDevolucaoIND_MODIFICADO.Value := 'S';
        if CdItensDevolucaoQT_QUANTIDADE.Value > 0 then
          CdItensDevolucaoIND_MARCADO.Value := 'S'
        else
        begin
          CdItensDevolucaoIND_MARCADO.Value := 'N';
          wRepetido := 1;
        end;
      end
    end
    else
      if CdItensDevolucaoIND_MARCADO.Value = 'S' then
        CdItensDevolucaoIND_MARCADO.Value := 'N'
      else
        if CdItensDevolucaoQT_QUANTIDADE.Value > 0 then
          CdItensDevolucaoIND_MARCADO.Value := 'S';
    CdItensDevolucao.Post;
  end;
end;

procedure TFDevolucaoCarregaItens.BtnTodosClick(Sender: TObject);
begin
  if BtnTodos.Caption = 'Marcar Todos' then
  begin
    todos(True);
    BtnTodos.Caption := 'Desmarcar Todos';
  end
  else
  begin
    todos(False);
    BtnTodos.Caption := 'Marcar Todos';
  end;
end;

procedure TFDevolucaoCarregaItens.todos(acao: boolean);
begin
  CdItensDevolucao.DisableControls;
  CdItensDevolucao.First;
  while not CdItensDevolucao.Eof do
  begin
    CdItensDevolucao.Edit;        
    if acao then
      CdItensDevolucaoIND_MARCADO.Value := 'S'
    else
      CdItensDevolucaoIND_MARCADO.Value := 'N';
    CdItensDevolucao.Post;

    CdItensDevolucao.Next;
  end;
  CdItensDevolucao.First;
  CdItensDevolucao.EnableControls;
end;

procedure TFDevolucaoCarregaItens.CdItensDevolucaoAfterOpen(
  DataSet: TDataSet);
begin
  countSelecionados := 0;
end;

procedure TFDevolucaoCarregaItens.CdItensDevolucaoIND_MARCADOChange(
  Sender: TField);
begin
  countSelecionados := countSelecionados + bib.ift(CdItensDevolucaoIND_MARCADO.Value = 'S', 1, -1);
end;

procedure TFDevolucaoCarregaItens.MECodigoBarrasExit(Sender: TObject);
begin
  if DMParamSistema.CodEmpresa = 'MODASUL' then
    MECodigoBarrasMODASUL
  else if DMParamSistema.CodEmpresa = 'JASOL' then
    MECodigoBarrasJASOL
  else if DMParamSistema.CodEmpresa = 'DONNA' then
    MECodigoBarrasDONNA
  else if DMParamSistema.CodEmpresa = 'NFCE-SHADA' then
    MECodigoBarrasELSHADAY
  else if DMParamSistema.CodEmpresa = 'PILILICOS' then
    MECodigoBarrasPILILICOS
  else
    MECodigoBarrasNormal;

end;

procedure TFDevolucaoCarregaItens.MECodigoBarrasMODASUL;
var recNo: Integer;
begin
  if trim(MECodigoBarras.Text) <> '' then
  begin
    if not CdItensDevolucao.Eof then
    begin
      CdItensDevolucao.DisableControls;
      recNo := CdItensDevolucao.RecNo;
      CdItensDevolucao.First;
      while not CdItensDevolucao.Eof do
      begin
        if (CdItensDevolucaoCOD_PRODUTO.Value = StrToInt(Copy(MECodigoBarras.Text, 1,6))) and
          (CdItensDevolucaoCOD_LOTE_TIPO.Value = StrToInt(Copy(MECodigoBarras.Text, 7,2))) then
        begin
          BotaoMarcarClicado := False;
          DBGrid1CellClick(DBGrid1.Columns[0]);
          BotaoMarcarClicado := True;
        end;
        CdItensDevolucao.Next;
      end;
      CdItensDevolucao.RecNo := recNo;
      CdItensDevolucao.EnableControls;
    end;
    MECodigoBarras.Clear;
    MECodigoBarras.SetFocus;
  end;
end;

procedure TFDevolucaoCarregaItens.MECodigoBarrasNormal;
var recNo: Integer;
begin
  if trim(MECodigoBarras.Text) <> '' then
  begin
    if not CdItensDevolucao.Eof then
    begin
      CdItensDevolucao.DisableControls;
      recNo := CdItensDevolucao.RecNo;
      CdItensDevolucao.First;
      while not CdItensDevolucao.Eof do
      begin
        if (CdItensDevolucaoCOD_PRODUTO.Value = StrToInt(Copy(MECodigoBarras.Text, 1,6))) then
        begin
          BotaoMarcarClicado := False;
          DBGrid1CellClick(DBGrid1.Columns[0]);
          BotaoMarcarClicado := True;
        end;
        CdItensDevolucao.Next;
      end;
      CdItensDevolucao.RecNo := recNo;
      CdItensDevolucao.EnableControls;
    end;
    MECodigoBarras.Clear;
    MECodigoBarras.SetFocus;
  end;
end;

procedure TFDevolucaoCarregaItens.MECodigoBarrasDONNA;
var recNo: Integer;
begin
  wRepetido := 0;
  if trim(MECodigoBarras.Text) <> '' then
  begin
    if not CdItensDevolucao.Eof then
    begin
      CdItensDevolucao.DisableControls;
      recNo := CdItensDevolucao.RecNo;
      CdItensDevolucao.First;
      while not CdItensDevolucao.Eof do
      begin                                                                                                        {suporte:7981}
        if (CdItensDevolucaoCOD_PRODUTO.Value = StrToInt(Copy(MECodigoBarras.Text, 1,6))) and (wRepetido = 0) then //Alterado para verificar o wRepetido. Começou a utilizar frente de caixa sem agrupar o código do produto.  Junior 28/09/23
        begin
          BotaoMarcarClicado := False;
          DBGrid1CellClick(DBGrid1.Columns[0]);
          BotaoMarcarClicado := True;
        end;
        CdItensDevolucao.Next;
      end;
      CdItensDevolucao.RecNo := recNo;
      CdItensDevolucao.EnableControls;
    end;
    MECodigoBarras.Clear;
    MECodigoBarras.SetFocus;
  end;
end;

procedure TFDevolucaoCarregaItens.MECodigoBarrasJASOL;
var recNo: Integer;
    wCod_produto: String;
begin
  wRepetido := 0;
  if trim(MECodigoBarras.Text) <> '' then
  begin
    if not CdItensDevolucao.Eof then
    begin
      CdItensDevolucao.DisableControls;
      recNo := CdItensDevolucao.RecNo;
      CdItensDevolucao.First;
      while not CdItensDevolucao.Eof do
      begin
        if (Length(MECodigoBarras.Text) = 13)  then
          wCod_produto := Copy(MECodigoBarras.Text,3,8)
        else
          wCod_produto := Copy(MECodigoBarras.Text,1,6);
        if (CdItensDevolucaoCOD_PRODUTO.Value = StrToInt(wCod_produto)) and (wRepetido = 0) then
        begin
          BotaoMarcarClicado := False;
          DBGrid1CellClick(DBGrid1.Columns[0]);
          BotaoMarcarClicado := True;
        end;
        CdItensDevolucao.Next;
      end;
      CdItensDevolucao.RecNo := recNo;
      CdItensDevolucao.EnableControls;
    end;
    MECodigoBarras.Clear;
    MECodigoBarras.SetFocus;
  end;
end;

procedure TFDevolucaoCarregaItens.MECodigoBarrasELSHADAY;
var recNo: Integer;
begin
  wRepetido := 0;
  if trim(MECodigoBarras.Text) <> '' then
  begin
    if not CdItensDevolucao.Eof then
    begin
      CdItensDevolucao.DisableControls;
      recNo := CdItensDevolucao.RecNo;
      CdItensDevolucao.First;
      while not CdItensDevolucao.Eof do
      begin                                                                                                        {suporte:7981}
        if (CdItensDevolucaoCOD_PRODUTO.Value = StrToInt(Copy(MECodigoBarras.Text, 1,6))) and (wRepetido = 0) then //Alterado para verificar o wRepetido. Começou a utilizar frente de caixa sem agrupar o código do produto.  Junior 28/09/23
        begin
          BotaoMarcarClicado := False;
          DBGrid1CellClick(DBGrid1.Columns[0]);
          BotaoMarcarClicado := True;
        end;
        CdItensDevolucao.Next;
      end;
      CdItensDevolucao.RecNo := recNo;
      CdItensDevolucao.EnableControls;
    end;
    MECodigoBarras.Clear;
    MECodigoBarras.SetFocus;
  end;
end;

procedure TFDevolucaoCarregaItens.MECodigoBarrasPILILICOS;
var recNo: Integer;
begin
  wRepetido := 0;
  if trim(MECodigoBarras.Text) <> '' then
  begin
    if not CdItensDevolucao.Eof then
    begin
      CdItensDevolucao.DisableControls;
      recNo := CdItensDevolucao.RecNo;
      CdItensDevolucao.First;
      while not CdItensDevolucao.Eof do
      begin                                                                                                        {suporte:7981}
        if (CdItensDevolucaoCOD_PRODUTO.Value = StrToInt(Copy(MECodigoBarras.Text, 1,6))) and (wRepetido = 0) then //Alterado para verificar o wRepetido. Começou a utilizar frente de caixa sem agrupar o código do produto.  Junior 28/09/23
        begin
          BotaoMarcarClicado := False;
          DBGrid1CellClick(DBGrid1.Columns[0]);
          BotaoMarcarClicado := True;
        end;
        CdItensDevolucao.Next;
      end;
      CdItensDevolucao.RecNo := recNo;
      CdItensDevolucao.EnableControls;
    end;
    MECodigoBarras.Clear;
    MECodigoBarras.SetFocus;
  end;
end;

procedure TFDevolucaoCarregaItens.FormActivate(Sender: TObject);
begin
  if ((DMParamSistema.CodEmpresa = 'MODASUL')
    or (DMParamSistema.CodEmpresa = 'JASOL') or
       (DMParamSistema.CodEmpresa= 'DONNA') or
       (DMParamSistema.CodEmpresa = 'NFCE-SHADA') or
       (DMParamSistema.CodEmpresa = 'PILILICOS')   )
    and (MECodigoBarras.Visible) then
  begin
    BtnTodosClick(Self);
    MECodigoBarras.Clear;
    MECodigoBarras.SetFocus;
  end;
end;

end.

