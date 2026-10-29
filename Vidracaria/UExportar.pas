unit UExportar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, UFmProduto, DB, ImgList;

type
  TFExportar = class(TForm)
    FmProduto1: TFmProduto;
    DsExportarPedido: TDataSource;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    DsExportarReposicao: TDataSource;
    GbPedidos: TGroupBox;
    DbGPedidos: TDBGrid;
    GbReposicoes: TGroupBox;
    DbGReposicoes: TDBGrid;
    SaveDialog1: TSaveDialog;
    procedure FmProduto1MeProdutoExit(Sender: TObject);
    procedure DbGPedidosCellClick(Column: TColumn);
    procedure DbGPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FmProduto1BtProdutoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DbGReposicoesCellClick(Column: TColumn);
    procedure DbGReposicoesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    function RMaskCGC_CPF(wCgc1: string; Zeros: Integer): string;
    procedure Atualizar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExportar: TFExportar;

implementation

uses UVidracaria_cl, UOracle_cl, UPedidoCad, UPedido_cl, UBiblioteca,
  UParamSistema_cl;

{$R *.dfm}

procedure TFExportar.FmProduto1MeProdutoExit(Sender: TObject);
begin
  FmProduto1.MeProdutoExit(Sender);

  Atualizar;
end;

procedure TFExportar.Atualizar;
begin
  if Trim(FmProduto1.MeProduto.Text) <> '' then
  begin
    DmVidracaria.CdExportaPedido.Filtered := False;
    DmVidracaria.CdExportaPedido.Close;
    DmVidracaria.CdExportaPedido.Params.ParamByName('COD_PRODUTO').AsInteger := StrToInt(Trim(FmProduto1.MeProduto.Text));
    DmVidracaria.CdExportaPedido.Open;

    DmVidracaria.CdExportaReposicao.Filtered := False;
    DmVidracaria.CdExportaReposicao.Close;
    DmVidracaria.CdExportaReposicao.Params.ParamByName('COD_PRODUTO').AsInteger := StrToInt(Trim(FmProduto1.MeProduto.Text));
    DmVidracaria.CdExportaReposicao.Open;
  end;
end;

procedure TFExportar.DbGPedidosCellClick(Column: TColumn);
begin
  if Column.FieldName = 'IND_EXPORTADO' then
  begin
    DmVidracaria.CdExportaPedido.Edit;
    if DmVidracaria.CdExportaPedidoIND_EXPORTADO.Value = 'N' then
      DmVidracaria.CdExportaPedidoIND_EXPORTADO.Value := 'S'
    else
      DmVidracaria.CdExportaPedidoIND_EXPORTADO.Value := 'N';
    DmVidracaria.CdExportaPedido.Post;
  end;
end;

procedure TFExportar.DbGPedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'IND_EXPORTADO' then
  begin
    DbGPedidos.Canvas.FillRect(Rect);
    if DmVidracaria.CdExportaPedidoIND_EXPORTADO.Value = 'N' then
      ImageList1.Draw(DbGPedidos.Canvas, Rect.Left + 5, Rect.Top + 1, 3)
    else
      ImageList1.Draw(DbGPedidos.Canvas, Rect.Left + 5, Rect.Top + 1, 2);
  end;
end;

procedure TFExportar.FmProduto1BtProdutoClick(Sender: TObject);
begin
  FmProduto1.BtProdutoClick(Sender);
  Atualizar;
end;

procedure TFExportar.BitBtn1Click(Sender: TObject);
var
  F: TextFile;
  wNumPecas: integer;
  wAux, wNotas, wItens, wSubst: string;
begin
  wAux := '';
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
  Begin
    SaveDialog1.DefaultExt := 'ASCII';
    SaveDialog1.FileName := 'Exp.asc';
    SaveDialog1.Filter := 'Arquivo de Exportação';
  end
  else
  Begin
    SaveDialog1.DefaultExt := 'CSV';
    SaveDialog1.FileName := 'Exp.csv';
    SaveDialog1.Filter := 'Arquivo de Exportação';
  end;

  SaveDialog1.FilterIndex := 0;
  if (not (SaveDialog1.Execute)) then
  begin
    MessageDlg('Arquivo Não Gerado!', mtInformation, [mbOk], 0);
    Exit;
  end;

  with DmVidracaria do
  begin
    CdExportaPedido.Filtered := True;
    CdExportaReposicao.Filtered := True;

    wNotas := '';
    while not CdExportaPedido.Eof do
    begin
      wNotas := wNotas + CdExportaPedidoCOD_PEDIDO_CAB.Text;
      if CdExportaPedido.RecNo <> CdExportaPedido.RecordCount then
        wNotas := wNotas + ', ';
      CdExportaPedido.Next;
    end;

    wItens := '';
    while not CdExportaReposicao.Eof do
    begin
      wItens := wItens + CdExportaReposicaoCOD_PEDIDO_ITEM.Text;
      if CdExportaReposicao.RecNo <> CdExportaReposicao.RecordCount then
        wItens := wItens + ', ';
      CdExportaReposicao.Next;
    end;

    if ((CdExportaPedido.IsEmpty) and (CdExportaReposicao.IsEmpty)) then
      wSubst := '';
    if ((CdExportaPedido.IsEmpty) and (not (CdExportaReposicao.IsEmpty))) then
      wSubst := 'TB_PEDIDO_ITEM.COD_PEDIDO_ITEM IN (' + wItens + ')';
    if ((not (CdExportaPedido.IsEmpty)) and (CdExportaReposicao.IsEmpty)) then
      wSubst := 'TB_PEDIDO_CAB.COD_PEDIDO_CAB IN (' + wNotas + ')';
    if ((not (CdExportaPedido.IsEmpty)) and (not (CdExportaReposicao.IsEmpty))) then
      wSubst := 'TB_PEDIDO_CAB.COD_PEDIDO_CAB IN (' + wNotas + ') OR TB_PEDIDO_ITEM.COD_PEDIDO_ITEM IN (' + wItens + ')';
    wSubst := 'WHERE ' + wSubst;

    QExportarItem.Close;
    QExportarItem.SetVariable('SUBST', wSubst);
    QExportarItem.Open;

    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then//Arq.Importação p/ o Soft.opty way
    Begin
      wNumPecas := QExportarItem.RecordCount;
      //cabeçalho do arquivo de exportaçao 58 pos.
      wAux := copy('Pedido -' + DateToStr(Date) + '                                ', 1, 32);
      wAux := wAux + Bib.LimpaString(DateToStr(date), '/') + '        ' + RMaskCGC_CPF(IntToStr(wNumPecas), 8) + 'V3' + Chr(13) + Chr(10);
      //segunda linha 8 posiçoes numero de registros
      wAux := wAux + RMaskCGC_CPF(IntToStr(wNumPecas), 8) + Chr(13) + Chr(10);

      while not QExportarItem.Eof do
      begin
        DMOracle.ExecutaSql('UPDATE TB_MATERIAL SET IND_EXPORTADO = ' + QuotedStr('S') + ' WHERE COD_PEDIDO_ITEM = ' + QExportarItemCOD_PEDIDO_ITEM.Text);

        //descrição pos. 1 a 16
        wAux := wAux + copy(QExportarItemDESC_COMPLEMENTO.Text + '                ', 1, 16);
        //num.sequencial peça pos.17 a 21
        wAux := wAux + RMaskCGC_CPF(intToStr(QExportarItem.RecNo), 5);
        //cliente pos. 22 a 33
        wAux := wAux + copy(copy(QExportarItemDESC_FANTASIA.Text, 1, 9) + Copy(QExportarItemDESC_COMPLEMENTO_OBS.Text, 1, 3) + '            ', 1, 12);
        //num.pedido pos. 34 a 45
        if QExportarItemIND_QUEBRA.Value = 'S' then
          wAux := wAux + copy('R' + RMaskCGC_CPF(QExportarItemCOD_PEDIDO_CAB.Text, 7) + '            ', 1, 12)
        else
          wAux := wAux + copy(RMaskCGC_CPF(QExportarItemCOD_PEDIDO_CAB.Text, 7) + '            ', 1, 12);
        //shape id pos. 46 a 53
        if QExportarItemCOD_DESENHO_EXPORTACAO.Value <> '' then
          wAux := wAux + bib.FormataTextoEsq(QExportarItemCOD_DESENHO_EXPORTACAO.Value, 8)
        else
          wAux := wAux + '        ';
        //amoladura pos. 54 a 61
        wAux := wAux + RMaskCGC_CPF(QExportarItemVAL_AMOLADURA.Text, 8);
        //prioridade da peça pos. 62 a 64
        wAux := wAux + '  0';
        //rotation flag pos. 65 a 65
        wAux := wAux + 'Y';
        //num.peças a corta pos. 66 a 73
        wAux := wAux + '       1';
        //tool thickiness pos. 74 a 81
        wAux := wAux + '  9999.0';
        //largura pos. 82 a 89
        wAux := wAux + RMaskCGC_CPF(QExportarItemVAL_LARGURA.Text, 8);
        //altura pos. 90 a 97
        wAux := wAux + RMaskCGC_CPF(QExportarItemVAL_ALTURA.Text, 8);
        //spacer pos. 98 a 105
        wAux := wAux + '     0,0';
        //observaçao pos. 106 a 137
        if QExportarItemIND_TIPO.Text = 'F' then
          wAux := wAux + 'FIXO                            '
        else
          wAux := wAux + 'MOVEL                           ';
        //num. de rotulos pos. 138 a 142
        wAux := wAux + '    1';
        //exceded pieces pos. 143 a 147
        wAux := wAux + '    0';
        //preference values pos. 148 a 152
        wAux := wAux + '  999';
        //rack pos. 153 a 158
        wAux := wAux + RMaskCGC_CPF(QExportarItemCOD_PECA.Text, 6) + Chr(13) + Chr(10);

        if QExportarItemCOD_DESENHO_EXPORTACAO.Value <> '' then
          wAux := wAux + bib.FormataTextoEsq(QExportarItemCOD_DESENHO_EXPORTACAO.Value, 8) + ' -1 -1 -1 -1' + Chr(13) + Chr(10);
        QExportarItem.Next;
      end;
    end;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' then //Arq.Importação p/ o Soft.CORTE CERTO
    Begin
      while not QExportarItem.Eof do
      begin
        DMOracle.ExecutaSql('UPDATE TB_MATERIAL SET IND_EXPORTADO = ' + QuotedStr('S') + ' WHERE COD_PEDIDO_ITEM = ' + QExportarItemCOD_PEDIDO_ITEM.Text);

        wAux := wAux + RMaskCGC_CPF(QExportarItemCOD_PECA.Text, 8)+ ',';//Cód.Peça
        wAux := wAux + '1,'; //Qtde
        wAux := wAux + RMaskCGC_CPF(QExportarItemVAL_LARGURA.Text, 6) + ',';
        wAux := wAux + RMaskCGC_CPF(QExportarItemVAL_ALTURA.Text, 6) + ',';
        wAux := wAux + QExportarItemDESC_OBSERVACAO.Text + ',';
        wAux := wAux + copy(QExportarItemDESC_FANTASIA.Text, 1, 10)+'-' + Copy(QExportarItemDESC_COMPLEMENTO_OBS.Text, 1, 10);
        wAux := wAux +  Chr(13) + Chr(10);

        QExportarItem.Next;
      end;
    end;
    AssignFile(F, SaveDialog1.FileName);
    Rewrite(F);
    Writeln(F, wAux);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);

    CdExportaPedido.Filtered := False;
    CdExportaReposicao.Filtered := False;
  end;

  Atualizar;
end;

function TFExportar.RMaskCGC_CPF(wCgc1: string; Zeros: Integer): string;
var S: string;
  x: integer;
begin

  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
      S := S + wCgc1[x];

  while Length(S) < Zeros do
    S := '0' + S;

  Result := S;
end;

procedure TFExportar.DbGReposicoesCellClick(Column: TColumn);
begin
  if Column.FieldName = 'IND_EXPORTADO' then
  begin
    DmVidracaria.CdExportaReposicao.Edit;
    if DmVidracaria.CdExportaReposicaoIND_EXPORTADO.Value = 'N' then
      DmVidracaria.CdExportaReposicaoIND_EXPORTADO.Value := 'S'
    else
      DmVidracaria.CdExportaReposicaoIND_EXPORTADO.Value := 'N';
    DmVidracaria.CdExportaReposicao.Post;
  end;
end;

procedure TFExportar.DbGReposicoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'IND_EXPORTADO' then
  begin
    DbGReposicoes.Canvas.FillRect(Rect);
    if DmVidracaria.CdExportaReposicaoIND_EXPORTADO.Value = 'N' then
      ImageList1.Draw(DbGReposicoes.Canvas, Rect.Left + 5, Rect.Top + 1, 3)
    else
      ImageList1.Draw(DbGReposicoes.Canvas, Rect.Left + 5, Rect.Top + 1, 2);
  end;
end;

end.

