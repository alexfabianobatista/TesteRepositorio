unit UEmbarqueCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, variants, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFEmbarqueCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBEdit9: TDBEdit;
    BtConsTransportador: TBitBtn;
    BtConsPedido: TBitBtn;
    DataSource1: TDataSource;
    Carga1: TMenuItem;
    Acerto1: TMenuItem;
    EmbarqueNotaFiscal1: TMenuItem;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    EmbarquesCondioPagto1: TMenuItem;
    RotadeEntrega1: TMenuItem;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    SubstituioTributaria1: TMenuItem;
    Opes1: TMenuItem;
    EmissoNotas1: TMenuItem;
    LBParcela: TListBox;
    ConsultaEmbarquePelaNota1: TMenuItem;
    ExcluiProdutodoPedidodeUmEmbarque1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    RelaodeCargas1: TMenuItem;
    BaixaEstoquePeloEmbarque1: TMenuItem;
    Label12: TLabel;
    DBEdit13: TDBEdit;
    DataSource2: TDataSource;
    RelaoTotalPorPedidos1: TMenuItem;
    VoltaEstoquepeloEmbarque1: TMenuItem;
    RelaoBaixadoporData1: TMenuItem;
    RelProdutosEmbarcados1: TMenuItem;
    DBEdit14: TDBEdit;
    Label13: TLabel;
    EmbarqueNotaFiscaltxt1: TMenuItem;
    procedure SBConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtConsTransportadorClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtConsPedidoClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure Carga1Click(Sender: TObject);
    procedure Acerto1Click(Sender: TObject);
    procedure EmbarqueNotaFiscal1Click(Sender: TObject);
    procedure EmbarquesCondioPagto1Click(Sender: TObject);
    procedure RotadeEntrega1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SBHelpClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SubstituioTributaria1Click(Sender: TObject);
    procedure EmissoNotas1Click(Sender: TObject);
    procedure ConsultaEmbarquePelaNota1Click(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure ExcluiProdutodoPedidodeUmEmbarque1Click(Sender: TObject);
    procedure RelaodeCargas1Click(Sender: TObject);
    procedure BaixaEstoquePeloEmbarque1Click(Sender: TObject);
    procedure RelaoTotalPorPedidos1Click(Sender: TObject);
    procedure VoltaEstoquepeloEmbarque1Click(Sender: TObject);
    procedure RelaoBaixadoporData1Click(Sender: TObject);
    procedure RelProdutosEmbarcados1Click(Sender: TObject);
    procedure EmbarqueNotaFiscaltxt1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmbarqueCad: TFEmbarqueCad;

implementation

uses UEmbarque_cl, UOracle_cl, UCadastroCons, UCadastro_cl, UTela_cl,
  UEmbarqueCons, UPedidoCons, UPedido_cl, UEmbarqueParam, URPedido_Produto,
  UREmbarque, UREmbarque2, UREmbarque3, UREmbarque_Acerto, UREmbarquePedNf,
  UREmbarque1, UREmbarquePagto, UrEmbarquePedNf1, UREmbarque_Rota,
  UParamSistema_cl, UREmbarqueImposto, UNotaSaida_cl, USerie_cl,
  uNotaImpressao,UPrazoVencimento_cl,UBiblioteca, UEmbarqueNota,
  UUsuario_cl, UREmbarqueCarga, UEstoque_cl, UrEmbarquePedido,
  UREmbarqueBaixado, URProdutoEmbarcado;

{$R *.DFM}

procedure TFEmbarqueCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFEmbarqueCad.FormActivate(Sender: TObject);
Var wEmpresa : String;
begin
  inherited;
  With DMEmbarque do
  Begin
    QEmbarque.Open;
    QEmbarqueItem.Open;
  End;
  DMTela.VerificaTela('VENDA',FEmbarqueCad.Caption,FEmbarqueCad.Name);
  wEmpresa := DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA', 'COD_FILIAL > 0');
  if wEmpresa <> 'CGS' Then
  Begin
    DBEdit10.Visible := False;
    DBEdit11.Visible := False;
    Label9.Visible := False;
    Label10.Visible := False;
  end;
  if (wEmpresa <> 'FAVILLE') And
     (wEmpresa <> 'ZADIMEL') Then
  Begin
    DBEdit12.Visible := False;
    Label11.Visible := False;
  End;
end;

procedure TFEmbarqueCad.BtConsTransportadorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMEmbarque.QEmbarqueCod_Transportador.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFEmbarqueCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',QEmbarqueConsCod_Embarque.Value);
    QEmbarque.Open;
  End;
end;

procedure TFEmbarqueCad.BtConsPedidoClick(Sender: TObject);
begin
  inherited;
  If FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  If FPedidoCons.ShowModal = mrOk then
  Begin
    DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Value := DMPedido.QPedidoConsCod_Pedido_Cab.Value;
    DBEdit8Exit(Self);
  End;
end;

procedure TFEmbarqueCad.DataSource1StateChange(Sender: TObject);
begin
  inherited;
  BtConsPedido.Enabled := DMEmbarque.QEmbarqueItem.State in [dsEdit,dsInsert];
end;

procedure TFEmbarqueCad.Carga1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[0].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    DmUsuario.Checar_Filial_Usuario(Trim(FEmbarqueParam.MeFilial.Text),'VENDA');
    QREmbarque.Close;
    QREmbarque2.Close;
    QREmbarque3.Close;
    if Trim(FEmbarqueParam.MEEmbarque.Text) = '' then
    begin
      QREmbarque.SetVariable('EMBARQUE',Null);
      QREmbarque2.SetVariable('EMBARQUE',Null);
      QREmbarque3.SetVariable('EMBARQUE',Null);
    end
    Else
    begin
      QREmbarque.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      QREmbarque2.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      QREmbarque3.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
    End;
    Case FEmbarqueParam.Rg0Operacao.ItemIndex Of
     0 :
      Begin
        QREmbarque.SetVariable('IND_LIVRO_FISCAL','S');
        QREmbarque2.SetVariable('IND_LIVRO_FISCAL','S');
        QREmbarque3.SetVariable('IND_LIVRO_FISCAL','S');
      End;
     1 :
      Begin
        QREmbarque.SetVariable('IND_LIVRO_FISCAL','N');
        QREmbarque2.SetVariable('IND_LIVRO_FISCAL','N');
        QREmbarque3.SetVariable('IND_LIVRO_FISCAL','N');
      End;
     2 :
      Begin
        QREmbarque.SetVariable('IND_LIVRO_FISCAL',Null);
        QREmbarque2.SetVariable('IND_LIVRO_FISCAL',Null);
        QREmbarque3.SetVariable('IND_LIVRO_FISCAL',Null);
      End;
    End;
    Case FEmbarqueParam.Rg0Pintura.ItemIndex Of
     0 :
      Begin
        QREmbarque.SetVariable('IND_PINTURA','SIM');
        QREmbarque2.SetVariable('IND_PINTURA','SIM');
      End;
     1 :
      Begin
        QREmbarque.SetVariable('IND_PINTURA',Null);
        QREmbarque2.SetVariable('IND_PINTURA',Null);
      End;
    End;
    Case FEmbarqueParam.Rg0Estofaria.ItemIndex Of
     0 :
      Begin
        QREmbarque.SetVariable('IND_ESTOFARIA','SIM');
        QREmbarque2.SetVariable('IND_ESTOFARIA','SIM');
      End;
     1 :
      Begin
        QREmbarque.SetVariable('IND_ESTOFARIA',Null);
        QREmbarque2.SetVariable('IND_ESTOFARIA',Null);
      End;
    End;
    If Trim(FEmbarqueParam.ME0Operacao1.Text) = '' then
     begin
      QREmbarque.SetVariable('COD_OPERACAO1',Null);
      QREmbarque2.SetVariable('COD_OPERACAO1',Null);
      QREmbarque3.SetVariable('COD_OPERACAO1',Null);
     end
    Else
     begin
      QREmbarque.SetVariable('COD_OPERACAO1',FEmbarqueParam.ME0Operacao1.Text);
      QREmbarque2.SetVariable('COD_OPERACAO1',FEmbarqueParam.ME0Operacao1.Text);
      QREmbarque3.SetVariable('COD_OPERACAO1',FEmbarqueParam.ME0Operacao1.Text);
     end;
    If Trim(FEmbarqueParam.ME0Operacao2.Text) = '' then
     begin
      QREmbarque.SetVariable('COD_OPERACAO2',Null);
      QREmbarque2.SetVariable('COD_OPERACAO2',Null);
      QREmbarque3.SetVariable('COD_OPERACAO2',Null);
     end
    Else
     begin
      QREmbarque.SetVariable('COD_OPERACAO2',FEmbarqueParam.ME0Operacao2.Text);
      QREmbarque2.SetVariable('COD_OPERACAO2',FEmbarqueParam.ME0Operacao2.Text);
      QREmbarque3.SetVariable('COD_OPERACAO2',FEmbarqueParam.ME0Operacao2.Text);
     end;
    If Trim(FEmbarqueParam.ME0Operacao3.Text) = '' then
     begin
      QREmbarque.SetVariable('COD_OPERACAO3',Null);
      QREmbarque2.SetVariable('COD_OPERACAO3',Null);
      QREmbarque3.SetVariable('COD_OPERACAO3',Null);
     end
    Else
     begin
      QREmbarque.SetVariable('COD_OPERACAO3',FEmbarqueParam.ME0Operacao3.Text);
      QREmbarque2.SetVariable('COD_OPERACAO3',FEmbarqueParam.ME0Operacao3.Text);
      QREmbarque3.SetVariable('COD_OPERACAO3',FEmbarqueParam.ME0Operacao3.Text);
     end;
    If Trim(FEmbarqueParam.ME0Operacao4.Text) = '' then
     begin
      QREmbarque.SetVariable('COD_OPERACAO4',Null);
      QREmbarque2.SetVariable('COD_OPERACAO4',Null);
      QREmbarque3.SetVariable('COD_OPERACAO4',Null);
     end
    Else
     begin
      QREmbarque.SetVariable('COD_OPERACAO4',FEmbarqueParam.ME0Operacao4.Text);
      QREmbarque2.SetVariable('COD_OPERACAO4',FEmbarqueParam.ME0Operacao4.Text);
      QREmbarque3.SetVariable('COD_OPERACAO4',FEmbarqueParam.ME0Operacao4.Text);
     end;
    QREmbarque.SetVariable('COD_OPERACAO_NULLO',Trim(FEmbarqueParam.ME0Operacao1.Text)+Trim(FEmbarqueParam.ME0Operacao2.Text)+Trim(FEmbarqueParam.ME0Operacao3.Text)+Trim(FEmbarqueParam.ME0Operacao4.Text));
    QREmbarque2.SetVariable('COD_OPERACAO_NULLO',Trim(FEmbarqueParam.ME0Operacao1.Text)+Trim(FEmbarqueParam.ME0Operacao2.Text)+Trim(FEmbarqueParam.ME0Operacao3.Text)+Trim(FEmbarqueParam.ME0Operacao4.Text));
    QREmbarque3.SetVariable('COD_OPERACAO_NULLO',Trim(FEmbarqueParam.ME0Operacao1.Text)+Trim(FEmbarqueParam.ME0Operacao2.Text)+Trim(FEmbarqueParam.ME0Operacao3.Text)+Trim(FEmbarqueParam.ME0Operacao4.Text));
    QREmbarque.Open;
    QREmbarque2.Open;
    QREmbarque3.Open;
    If FREmbarque = Nil then
      FREmbarque := TFREmbarque.Create(Application);
    If FREmbarque2 = Nil then
      FREmbarque2 := TFREmbarque2.Create(Application);
    If FREmbarque3 = Nil then
      FREmbarque3 := TFREmbarque3.Create(Application);
    If DmParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' Then
      FREmbarque.QRGroup1.ForceNewPage := True;
    FREmbarque.QRLTitulo.Caption := 'Relacao Para Carga Caminhao Nr. '+FEmbarqueParam.MEEmbarque.text;
    FREmbarque.QRLEmpresa.Caption := 'Empresa:'+FEmbarqueParam.EdFilial.Text;
    FREmbarque2.QRLEmpresa.Caption := 'Empresa:'+FEmbarqueParam.EdFilial.Text;
    FREmbarque3.QRLEmpresa.Caption := 'Empresa:'+FEmbarqueParam.EdFilial.Text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
       FREmbarque.QRCompositeReport1.Preview
    Else
      FREmbarque.QRCompositeReport1.Print;
    QREmbarque.Close;
    QREmbarque2.Close;
    QREmbarque3.Close;
  End;
end;

procedure TFEmbarqueCad.Acerto1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[0].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FEmbarqueParam.MeFilial.Text),'VENDA');
    QEmbarque.Close;
    QREmbarque3.Close;
    QRNFs.Close;
    QSomaNF.Close;
    QSomaNF2.Close;
    QSomaImposto.Close;
    If Trim(FEmbarqueParam.MEEmbarque.Text) = '' then
    Begin
      QEmbarque.SetVariable('PK',Null);
      QREmbarque3.SetVariable('EMBARQUE',Null);
      QSomaNF.SetVariable('EMBARQUE',Null);
    End
    Else
    begin
      QEmbarque.SetVariable('PK',FEmbarqueParam.MEEmbarque.Text);
      QREmbarque3.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      QRNFs.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      QSomaNF.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      QSomaNF2.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      QSomaImposto.SetVariable('COD_EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
    End;
    Case FEmbarqueParam.Rg0Operacao.ItemIndex Of
     0 :
      Begin
        QREmbarque3.SetVariable('IND_LIVRO_FISCAL','S');
        QSomaNF.SetVariable('IND_LIVRO_FISCAL','S');
        QSomaNF2.SetVariable('IND_LIVRO_FISCAL','S');
        QRNFs.SetVariable('IND_LIVRO_FISCAL','S');
        QSomaImposto.SetVariable('IND_LIVRO_FISCAL','S');
      End;
     1 :
      Begin
        QREmbarque3.SetVariable('IND_LIVRO_FISCAL','N');
        QSomaNF.SetVariable('IND_LIVRO_FISCAL','N');
        QSomaNF2.SetVariable('IND_LIVRO_FISCAL','N');
        QRNFs.SetVariable('IND_LIVRO_FISCAL','N');
        QSomaImposto.SetVariable('IND_LIVRO_FISCAL','N');
      End;
     2 :
      Begin
        QREmbarque3.SetVariable('IND_LIVRO_FISCAL',Null);
        QSomaNF.SetVariable('IND_LIVRO_FISCAL',Null);
        QSomaNF2.SetVariable('IND_LIVRO_FISCAL',Null);
        QRNFs.SetVariable('IND_LIVRO_FISCAL',Null);
        QSomaImposto.SetVariable('IND_LIVRO_FISCAL',Null);
      End;
    End;
    QEmbarque.Open;
    QREmbarque3.Open;
    QSomaNF.Open;
    QSomaImposto.Open;
    QSomaNF2.Open;
    QRNFs.Open;
    If FREmbarque_Acerto = Nil then
      FREmbarque_Acerto := TFREmbarque_Acerto.Create(Application);
    FREmbarque_Acerto.QRLNota.Caption := '';
    While not QRNFs.Eof do
    Begin
      FREmbarque_Acerto.QRLNota.Caption := FREmbarque_Acerto.QRLNota.Caption
                                           +QRNFsNum_Nota.Text+' ';
      QRNFs.Next;
    End;

    If FREmbarque3 = Nil then
       FREmbarque3 := TFREmbarque3.Create(Application);
    FREmbarque_Acerto.QRLTitulo.Caption := 'Controle de Cargas '+FEmbarqueParam.MEEmbarque.text;
    FREmbarque_Acerto.QRLNumero.Caption := FEmbarqueParam.MEEmbarque.text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FREmbarque_Acerto.QRCompositeReport1.Preview
    Else
      FREmbarque_Acerto.QRCompositeReport1.Print;
  End;
end;

procedure TFEmbarqueCad.EmbarqueNotaFiscal1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[0].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FEmbarqueParam.MeFilial.Text),'VENDA');
    QREmbarque_Ped_Nf.Close;
    QREmbarque_Ped_Nf1.Close;
    If Trim(FEmbarqueParam.MEEmbarque.Text) = '' then
     Begin
      QREmbarque_Ped_Nf.SetVariable('EMBARQUE',Null);
      QREmbarque_Ped_Nf1.SetVariable('EMBARQUE',Null)
     End
    Else
     Begin
      QREmbarque_Ped_Nf.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      QREmbarque_Ped_Nf1.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
     End;
    If Trim(FEmbarqueParam.ME0Vendedor.Text) = '' then
     Begin
      QREmbarque_Ped_Nf.SetVariable('COD_VENDEDOR',Null);
      QREmbarque_Ped_Nf1.SetVariable('COD_VENDEDOR',Null)
     End
    Else
     Begin
      QREmbarque_Ped_Nf.SetVariable('COD_VENDEDOR',FEmbarqueParam.ME0Vendedor.Text);
      QREmbarque_Ped_Nf1.SetVariable('COD_VENDEDOR',FEmbarqueParam.ME0Vendedor.Text);
     End;
    Case FEmbarqueParam.Rg0Operacao.ItemIndex Of
     0 :
      Begin
        QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL','S');
        QREmbarque_Ped_Nf1.SetVariable('IND_LIVRO_FISCAL','S');
      End;
     1 :
      Begin
        QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL','N');
        QREmbarque_Ped_Nf1.SetVariable('IND_LIVRO_FISCAL','N');
      End;
     2 :
      Begin
        QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL',Null);
        QREmbarque_Ped_Nf1.SetVariable('IND_LIVRO_FISCAL',Null);
      End;
    End;
    QREmbarque_Ped_Nf.Open;
    QREmbarque_Ped_Nf1.Open;
    If FrEmbarque_Ped_Nf = Nil then
      FrEmbarque_Ped_Nf := TFrEmbarque_Ped_Nf.Create(Application);
    If FrEmbarque_Ped_Nf1 = Nil then
      FrEmbarque_Ped_Nf1 := TFrEmbarque_Ped_Nf1.Create(Application);
    FREmbarque_Ped_Nf.QRLTitulo.Caption := 'Relacao Notas Para Embarque Nr. '+FEmbarqueParam.MEEmbarque.text;
    FREmbarque_Ped_Nf1.QRLTitulo.Caption := 'Resumo Notas Para Embarque Nr. '+FEmbarqueParam.MEEmbarque.text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FREmbarque_Ped_Nf.QRCompositeReport1.Preview
    Else
      FrEmbarque_Ped_Nf.QRCompositeReport1.Preview;
    QREmbarque_Ped_Nf.Close;
    QREmbarque_Ped_Nf1.Close;
  End;

end;

procedure TFEmbarqueCad.EmbarquesCondioPagto1Click(Sender: TObject);
Var wTipoPagto:String;
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[1].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QRAcertoCondPagto.Close;
    QRAcertoCondPagto.Sql.Clear;
    If FEmbarqueParam.Rg1Tipo.ItemIndex = 0 Then
     Begin
      QRAcertoCondPagto.Sql.Add('SELECT Tb_nota_cab.COD_CADASTRO,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_NOTA_CAB,Tb_embarque.COD_EMBARQUE,TB_EMBARQUE.NUM_EMBARQUE,');
      QRAcertoCondPagto.Sql.Add('Tb_embarque.NOME_MOTORISTA,Tb_embarque.DT_EMBARQUE,Tb_Cadastro.Nome,SUM(Tb_nota_item.VAL_TOTAL - Tb_nota_item.Val_Desconto) AS SVAL_TOTAL,');
      QRAcertoCondPagto.Sql.Add('SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE FROM TB_BAIXA_PEDIDO,TB_PEDIDO_CAB,TB_PEDIDO_ITEM,TB_EMBARQUE,');
      QRAcertoCondPagto.Sql.Add('TB_EMBARQUE_ITEM,TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO WHERE (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)');
      QRAcertoCondPagto.Sql.Add(' AND (Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM) AND (Tb_pedido_item.COD_PEDIDO_ITEM = Tb_baixa_pedido.COD_PEDIDO_ITEM) ');
      QRAcertoCondPagto.Sql.Add(' AND (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB) AND (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE) ');
      QRAcertoCondPagto.Sql.Add(' AND (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB) AND (Tb_nota_Cab.COD_CADASTRO = Tb_CADASTRO.COD_CADASTRO) ');
      QRAcertoCondPagto.Sql.Add(' AND (TB_NOTA_CAB.IND_SITUACAO = ' + chr(39) + '2' + chr(39)+')');
      QRAcertoCondPagto.Sql.Add(' AND (TB_EMBARQUE.COD_EMBARQUE = ' +  Trim(FEmbarqueParam.ME1Embarque.Text)+')');
      Case FEmbarqueParam.RGTipoPagto.ItemIndex of
        0 :
         Begin
          QRAcertoCondPagto.Sql.Add(' AND (TB_NOTA_CAB.IND_CONDICAO_PAGTO = ' + chr(39) + '1' + chr(39)+')');
          wTipoPagto := ' A Vista';
         End;
        1 :
         Begin
          QRAcertoCondPagto.Sql.Add(' AND (TB_NOTA_CAB.IND_CONDICAO_PAGTO = ' + chr(39) + '2' + chr(39)+')');
          wTipoPagto := ' A Prazo';
         End;
        2 :
         Begin
          QRAcertoCondPagto.Sql.Add(' AND (TB_NOTA_CAB.IND_CONDICAO_PAGTO = ' + chr(39) + '3' + chr(39)+')');
          wTipoPagto := ' Com Cheque';
         End;
      End;
      QRAcertoCondPagto.Sql.Add(' GROUP BY Tb_nota_cab.COD_CADASTRO,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_NOTA_CAB,Tb_embarque.COD_EMBARQUE,TB_EMBARQUE.NUM_EMBARQUE,');
      QRAcertoCondPagto.Sql.Add(' Tb_embarque.DT_EMBARQUE,Tb_embarque.NOME_MOTORISTA,Tb_cadastro.NOME ORDER BY Tb_nota_cab.NUM_NOTA');
     end
    else
     Begin
      QRAcertoCondPagto.Sql.Add('SELECT Tb_pedido_cab.COD_CADASTRO,Tb_pedido_cab.num_pedido as NUM_NOTA,Tb_pedido_cab.cod_pedido_cab as COD_NOTA_CAB,Tb_embarque.COD_EMBARQUE,TB_EMBARQUE.NUM_EMBARQUE,');
      QRAcertoCondPagto.Sql.Add('Tb_embarque.NOME_MOTORISTA,Tb_embarque.DT_EMBARQUE,Tb_Cadastro.Nome,SUM((Tb_pedido_item.VAL_UNITARIO - Tb_pedido_item.Val_Desconto) * Tb_Pedido_Item.Qt_Pedido) AS SVAL_TOTAL,');
      QRAcertoCondPagto.Sql.Add('SUM(Tb_pedido_item.QT_PEDIDO) AS SQT_QUANTIDADE FROM TB_PEDIDO_CAB,TB_PEDIDO_ITEM,TB_EMBARQUE,');
      QRAcertoCondPagto.Sql.Add('TB_EMBARQUE_ITEM,TB_CADASTRO WHERE (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB)');
      QRAcertoCondPagto.Sql.Add(' AND (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE) ');
      QRAcertoCondPagto.Sql.Add(' AND (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB) AND (Tb_pedido_Cab.COD_CADASTRO = Tb_CADASTRO.COD_CADASTRO) ');
      QRAcertoCondPagto.Sql.Add(' AND (TB_EMBARQUE.COD_EMBARQUE = ' +  Trim(FEmbarqueParam.ME1Embarque.Text)+')');
      Case FEmbarqueParam.RGTipoPagto.ItemIndex of
        0 :
         Begin
          QRAcertoCondPagto.Sql.Add(' AND (Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + chr(39) + 'A VISTA' + chr(39)+')');
          wTipoPagto := ' A Vista';
         End;
        1 :
         Begin
          QRAcertoCondPagto.Sql.Add(' AND (Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + chr(39) + 'A PRAZO' + chr(39)+')');
          wTipoPagto := ' A Prazo';
         End;
        2 :
         Begin
          QRAcertoCondPagto.Sql.Add(' AND (Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + chr(39) + 'OUTROS' + chr(39)+')');
          wTipoPagto := ' Com Cheque';
         End;
      End;
      QRAcertoCondPagto.Sql.Add(' GROUP BY Tb_pedido_cab.COD_CADASTRO,Tb_pedido_cab.NUM_PEDIDO,Tb_pedido_cab.cod_pedido_cab,Tb_embarque.COD_EMBARQUE,TB_EMBARQUE.NUM_EMBARQUE,');
      QRAcertoCondPagto.Sql.Add(' Tb_embarque.DT_EMBARQUE,Tb_embarque.NOME_MOTORISTA,Tb_cadastro.NOME ORDER BY Tb_pedido_cab.NUM_PEDIDO');
     end;
    QRAcertoCondPagto.Open;
    If FrEmbarquePagto = Nil then
      FrEmbarquePagto := TFrEmbarquePagto.Create(Application);
    FrEmbarquePagto.QRLTitulo.Caption := 'Relacao Cargas Por Condicao Pagto '+wTipoPagto;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FrEmbarquePagto.QRPrimario.Preview
    Else
      FrEmbarquePagto.QRPrimario.Print;
    QRAcertoCondPagto.Close;
  End;

end;

procedure TFEmbarqueCad.RotadeEntrega1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[2].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QREmbarque_Rota.Close;
    If Trim(FEmbarqueParam.ME2Embarque1.Text) <> '' then
      QREmbarque_Rota.SetVariable('COD_EMBARQUE1',FEmbarqueParam.ME2Embarque1.Text);

    If Trim(FEmbarqueParam.ME2Embarque2.Text) <> '' then
      QREmbarque_Rota.SetVariable('COD_EMBARQUE2',FEmbarqueParam.ME2Embarque2.Text);

    If Trim(FEmbarqueParam.ME2Embarque3.Text) <> '' then
      QREmbarque_Rota.SetVariable('COD_EMBARQUE3',FEmbarqueParam.ME2Embarque3.Text);

    If Trim(FEmbarqueParam.ME2Embarque4.Text) <> '' then
      QREmbarque_Rota.SetVariable('COD_EMBARQUE4',FEmbarqueParam.ME2Embarque4.Text);
    Case FEmbarqueParam.Rg2Operacao.ItemIndex Of
     0 : QREmbarque_Rota.SetVariable('IND_LIVRO_FISCAL','S');
     1 : QREmbarque_Rota.SetVariable('IND_LIVRO_FISCAL','N');
     2 : QREmbarque_Rota.SetVariable('IND_LIVRO_FISCAL',Null);
    End;
    QREmbarque_Rota.Open;
    If FrEmbarque_Rota = Nil then
      FrEmbarque_Rota := TFrEmbarque_Rota.Create(Application);
    FrEmbarque_Rota.QRLTitulo.Caption := 'Relatório de Entrega Rota(s) Nr '+FEmbarqueParam.ME2Embarque1.Text+ ' - ' + FEmbarqueParam.ME2Embarque2.Text + ' - ' + FEmbarqueParam.ME2Embarque3.Text + ' - ' + FEmbarqueParam.ME2Embarque4.Text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FrEmbarque_Rota.QRPrimario.Preview
    Else
      FrEmbarque_Rota.QRPrimario.Print;
    QREmbarque_Rota.Close;
  End;
end;

procedure TFEmbarqueCad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If Key = Chr(43) Then
  Begin
      DbNavigator1.BtnClick(NbInsert);
      DbEdit8.SetFocus;
  End;
  If Key = Chr(45) Then
  Begin
      DbNavigator1.BtnClick(NbDelete);
      DbEdit8.SetFocus;
  End;

end;

procedure TFEmbarqueCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(10);
end;

procedure TFEmbarqueCad.SBExcluirClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFEmbarqueCad.SubstituioTributaria1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[3].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FEmbarqueParam.ME2Filial.Text),'VENDA');
    QREmbarqueImposto.Close;
    If Trim(FEmbarqueParam.ME2Embarque.Text) <>'' Then
      QREmbarqueImposto.SetVariable('COD_EMBARQUE',Trim(FEmbarqueParam.ME2Embarque.Text))
    Else
      QREmbarqueImposto.SetVariable('COD_EMBARQUE',null);
    If Trim(FEmbarqueParam.ME2Filial.Text) = '' then
      QREmbarqueImposto.SetVariable('COD_FILIAL',Null)
    Else
      QREmbarqueImposto.SetVariable('COD_FILIAL',Trim(FEmbarqueParam.ME2Filial.Text));
    QREmbarqueImposto.SetVariable('COD_ESTADO',Trim(FEmbarqueParam.ME2Estado.Text));
    QREmbarqueImposto.Open;
    If FrEmbarqueImposto = Nil then
      FrEmbarqueImposto := TFrEmbarqueImposto.Create(Application);
    FrEmbarqueImposto.QRLCarga.Caption := 'Embarque Número: '+FEmbarqueParam.ME2Embarque.Text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FrEmbarqueImposto.QRPrimario.Preview
    Else
      FrEmbarqueImposto.QRPrimario.Print;
    QREmbarqueImposto.Close;
  End;
End;

procedure TFEmbarqueCad.EmissoNotas1Click(Sender: TObject);
Var wCadastro_Anterior,wOperacao_Anterior,wCod_Pedido_Anterior,wNum_Pedido_Anterior,wCont : Integer;
    wValor_Parcelas,wTotal : Real;
    wTipoNota,wLinha,wAux,wNumParcelas,wCodigo_Prazo : String;
Const wBranco : String = '                                      ';
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[4].TabVisible := True;
  FEmbarqueParam.Rg4OpcaoQtd.ItemIndex := 1;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QEmbarque_EmiteNota.Close;
    If Trim(FEmbarqueParam.Me3Embarque.Text) <> '' then
      QEmbarque_EmiteNota.SetVariable('EMBARQUE',FEmbarqueParam.ME3Embarque.Text)
    Else
      Raise Exception.Create ('Informar Número do Embarque');
    If Trim(FEmbarqueParam.Me3Operacao.Text) <> '' then
      QEmbarque_EmiteNota.SetVariable('COD_OPERACAO',FEmbarqueParam.Me3Operacao.Text)
    Else
      QEmbarque_EmiteNota.SetVariable('COD_OPERACAO',Null);
    Case FEmbarqueParam.Rg4Operacao.ItemIndex Of
     0 : QEmbarque_EmiteNota.SetVariable('IND_LIVRO_FISCAL','S');
     1 : QEmbarque_EmiteNota.SetVariable('IND_LIVRO_FISCAL','N');
     2 : QEmbarque_EmiteNota.SetVariable('IND_LIVRO_FISCAL',Null);
    End;
    Case FEmbarqueParam.Rg4OpcaoQtd.ItemIndex Of
     0 : QEmbarque_EmiteNota.SetVariable('QT_ZEROS',Null);
     1 : QEmbarque_EmiteNota.SetVariable('QT_ZEROS','NAO');
    End;
    If Trim(FEmbarqueParam.Me3Finalidade.Text) = '' then
      Raise Exception.Create ('Informar Código Finalidade');
    If Trim(FEmbarqueParam.Me3Banco.Text) = '' then
      Raise Exception.Create ('Informar Código do Bancos');
    QEmbarque_EmiteNota.Open;
    DMNotaSaida.QNotaSaida.Open;
    DMNotaSaida.QItemNf.Open;
    DMNotaSaida.QAtuBaixaPed.Open;
    DMNotaSaida.pConfirmando := True;
    wCadastro_Anterior := 0;
    wOperacao_Anterior := 0;
    wNum_Pedido_Anterior := 0;
    DMNotaSaida.pTrazPedido := True;
    Try
      While not QEmbarque_EmiteNota.Eof Do
      Begin
        With DMNotaSaida do
        Begin
          If (wCadastro_Anterior = QEmbarque_EmiteNotaCod_Cadastro.Value) And
             (wNum_Pedido_Anterior = QEmbarque_EmiteNotaNum_Pedido.Value) And
             (wOperacao_Anterior = QEmbarque_EmiteNotaCod_Operacao.Value)  then
             QNotaSaida.Edit
          Else
           Begin
             pCC:=True;
             QNotaSaida.Insert;
             QNotaSaidaCod_Filial.Value := QEmbarque_EmiteNotaCod_Filial.Value;
             QNotaSaidaCod_Cadastro.Value := QEmbarque_EmiteNotaCod_Cadastro.Value;
             If QEmbarque_EmiteNotaInd_Tipo_Pagamento.Value = 'A VISTA' Then
               QNotaSaidaInd_Condicao_Pagto.Value := '1'
             Else If QEmbarque_EmiteNotaInd_Tipo_Pagamento.Value = 'A PRAZO' Then
                    QNotaSaidaInd_Condicao_Pagto.Value := '2'
                  Else
                    QNotaSaidaInd_Condicao_Pagto.Value := '3';
             QNotaSaidaCod_Operacao.Value := QEmbarque_EmiteNotaCod_Operacao.Value;
             QNotaSaidaInd_Tipo_Frete.Value := QEmbarque_EmiteNotaInd_Tipo_Frete.Value;
             wTipoNota := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(QEmbarque_EmiteNotaCod_Operacao.Value) );
             If wTipoNota = 'F' Then // Nota Fiscal
                QNotaSaidaCod_Serie.Value := DMParamSistema.QParamSistemaCod_Serie_Nota.Value
             else
                QNotaSaidaCod_Serie.Value := DMParamSistema.QParamSistemaCod_Serie_Pedido.Value;
             QNotaSaidaPerc_Comissao.Value := QEmbarque_EmiteNotaPerc_Comissao_Nota.Value;
             QNotaSaidaCod_Vendedor.Value := QEmbarque_EmiteNotaCod_Vendedor.Value;
             QNotaSaidaVal_Desconto.Value := QEmbarque_EmiteNotaVal_Desconto.Value;
             QNotaSaidaNr_Dias_Cheque.Value := QEmbarque_EmiteNotaNr_Dias_Cheque.Value;
             QNotaSaidaNr_Dias_Cheque1.Value := QEmbarque_EmiteNotaNr_Dias_Cheque1.Value;
             QNotaSaidaNr_Dias_Cheque2.Value := QEmbarque_EmiteNotaNr_Dias_Cheque2.Value;
             QNotaSaidaNr_Dias_Cheque3.Value := QEmbarque_EmiteNotaNr_Dias_Cheque3.Value;
             QNotaSaidaNr_Dias_Cheque4.Value := QEmbarque_EmiteNotaNr_Dias_Cheque4.Value;
             QNotaSaidaObs_Complemento.Text := QEmbarque_EmiteNotaDesc_Complemento_Obs.Text;
             If DmParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' Then
                QNotaSaidaObs.Text := QEmbarque_EmiteNotaDesc_Observacao.Text;
             QNotaSaidaCod_Transportador.Value := QEmbarque_EmiteNotaCod_Transportador.Value;
             QNotaSaidaDesc_Placa.Value := Trim(FEmbarqueParam.Ed3Placa.Text)
           End;
           QItemNF.Insert;
           QItemNFCod_Produto.Value := QEmbarque_EmiteNotaCod_Produto.Value;
           QItemNFQt_Quantidade.Value := QEmbarque_EmiteNotaQt_Pedido.Value;
           If QEmbarque_EmiteNotaPerc_Desconto_Item.Value > 0 Then
              QItemNFVal_Unitario.Value := QEmbarque_EmiteNotaVal_Unitario.Value - (QEmbarque_EmiteNotaVal_Unitario.Value * QEmbarque_EmiteNotaPerc_Desconto_Item.Value / 100)
           Else
              QItemNFVal_Unitario.Value := QEmbarque_EmiteNotaVal_Unitario.Value;
           QItemNFCod_Tributacao.Value := QEmbarque_EmiteNotaCod_Tributacao.Value;
           QItemNFCod_Lote_Tipo.Value := QEmbarque_EmiteNotaCod_Lote_Tipo.Value;
           QItemNFPerc_Comissao.Value := QEmbarque_EmiteNotaPerc_Comissao_Itens.Value;
           If QItemNFPerc_Comissao.Value = 0 Then
              QItemNFPerc_Comissao.Value := QEmbarque_EmiteNotaPerc_Comissao_Nota.Value;
           If QItemNFQt_Quantidade.Value = 0 Then
              QItemNFVal_Total.Value := QItemNFVal_Unitario.Value
           Else
              QItemNFVal_Total.Value := QItemNFQt_Quantidade.Value*QItemNFVal_Unitario.Value;
           QItemNF.Post;
           QAtuBaixaPed.Insert;
           QAtuBaixaPedCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
           QAtuBaixaPedCod_Pedido_Item.Value := QEmbarque_EmiteNotaCod_Pedido_Item.Value;
           QAtuBaixaPedQt_Baixa.Value := QEmbarque_EmiteNotaQt_Pedido.Value;
           QAtuBaixaPed.Post;
           DMNotaSaida.QAtzItemPedido.Close;
           DMNotaSaida.QAtzItemPedido.SetVariable('COD_PEDIDO_ITEM',QAtuBaixaPedCod_Pedido_item.Value);
           DMNotaSaida.QAtzItemPedido.SetVariable('QT_ACRESCENTAR',(QAtuBaixaPedQt_Baixa.Value));
           DMNotaSaida.QAtzItemPedido.ExecSQL;
           wCadastro_Anterior := QEmbarque_EmiteNotaCod_Cadastro.Value;
           wOperacao_Anterior := QEmbarque_EmiteNotaCod_Operacao.Value;
           wNum_Pedido_Anterior := QEmbarque_EmiteNotaNum_Pedido.Value;
           wCodigo_Prazo := QEmbarque_EmiteNotaCod_Prazo_Vencimento.Text; // guarda para fazer parcelas
           wCod_Pedido_Anterior := QEmbarque_EmiteNotaCod_Pedido_Cab.Value; // guarda para atualizar data de faturamento do pedido
           QEmbarque_EmiteNota.Next;
           If (wCadastro_Anterior <> QEmbarque_EmiteNotaCod_Cadastro.Value) or
              (wOperacao_Anterior <> QEmbarque_EmiteNotaCod_Operacao.Value) or
              (wNum_Pedido_Anterior <> QEmbarque_EmiteNotaNum_Pedido.Value) or
              (QEmbarque_EmiteNota.Eof)  then
           Begin
{              QItemNF.First;
              While Not QItemNF.Eof do
              Begin
                QItemNF.Edit;
                QItemNFVal_ICM_Base.Value := 0;
                QItemNFVal_Desconto.Value := 0;
                QItemNF.Post;
                QItemNF.Next;
              End;  }
              If QNotaSaidaNum_Nota.Value = 0 then
                 QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value,QNotaSaidaCod_Serie.Value,
                                              QNotaSaidaCOD_SERIE_MODELO.Value);
              QSomaItemNota.Close;
              QSomaItemNota.Open;
              DMNotaSaida.AtualizaEstoque(-1);
              QNotaSaidaInd_Situacao.Value := '2'; // Confirmada
              QNotaSaida.Post;
              If QNotaSaidaInd_Condicao_Pagto.Value = '2' Then
              Begin
                wNumParcelas := DMOracle.BuscaNome('SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO','COD_PRAZO_VENCIMENTO = '+wCodigo_Prazo);
                wValor_Parcelas := QSomaItemNotaSVal_Total_Nota.Value / StrToInt(wNumParcelas);
                DMPrazoVencimento.QPrazoVencimentoDias.Close;
                DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO',wCodigo_Prazo);
                DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS',Null);
                DMPrazoVencimento.QPrazoVencimentoDias.Open;
                LBParcela.Items.Clear;
                wCont := 1;
                wTotal := 0;
                While not DMPrazoVencimento.QPrazoVencimentoDias.Eof Do
                Begin
                  wLinha := DateToStr(Date + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value);
                  if wCont = StrToInt(wNumParcelas) Then  // serve para calcular o valor da ultima parcela devido a diferenca de centavos
                     wValor_Parcelas := QSomaItemNotaSVal_Total_Nota.Value - wTotal;
                  wAux := FormatFloat('###,###,##0.00',wValor_Parcelas);
                  wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
                  wLinha := wLinha + wAux;
                  Inc(wCont);
                  wTotal := wTotal + StrToFloat(Bib.LimpaString(Trim(wAux),'.'));
                  LBParcela.Items.Add(wLinha);
                  DMPrazoVencimento.QPrazoVencimentoDias.Next;
                End;
                DMNotaSaida.GeraContaReceber(LBParcela.Items,StrToInt(Trim(FEmbarqueParam.Me3Finalidade.Text)),Trim(FembarqueParam.Me3Banco.Text),'1');
              End;
              FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
              QAtuDtFatura_Ped.Close;           // rotina para atualizar dt faturamento do pedido
              QAtuDtFatura_Ped.SetVariable('COD_PEDIDO_CAB',wCod_Pedido_Anterior);
              QAtuDtFatura_Ped.Open;
              QAtuDtFatura_Ped.Edit;
              QAtuDtFatura_PedDt_Faturamento.Value := DMOracle.DataServ;
              QAtuDtFatura_Ped.Post;
              QAtuDtFatura_Ped.Close;
              DMOracle.DBCemapa.Commit;
           End;
        End;
      End;
    Except
      Begin
        If DMNotaSaida.QNotaSaida.State in [dsEdit,dsInsert] then
         Begin
           DMNotaSaida.QNotaSaida.Cancel;
           DMNotaSaida.QItemNF.Cancel;
           DMNotaSaida.QAtuBaixaPed.Cancel;
         End;
        If DMOracle.DBCemapa.InTransaction then
           DMOracle.DBCemapa.RollBack;
        Raise;
      End;
    End;
    DMEmbarque.QEmbarque_EmiteNota.Close;
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QItemNf.Close;
    DMNotaSaida.QAtuBaixaPed.Close;
    DMNotaSaida.pConfirmando := False;
    DMNotaSaida.pTrazPedido := False;
  End;
END;
procedure TFEmbarqueCad.ConsultaEmbarquePelaNota1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueNota = Nil Then
     FEmbarqueNota := TFEmbarqueNota.Create(Application);
  FEmbarqueNota.ShowModal;
  DMEmbarque.QNotaEmbarque.Close;
end;

procedure TFEmbarqueCad.DBEdit8Exit(Sender: TObject);
Var wDtVencto, wClassificacao,wDescClassificacao,wCadastro : String;
    wAtendido : Real;
begin
  inherited;

  If Trim(DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Text) <> '' Then
   begin
     wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB','COD_PEDIDO_CAB = '+DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Text);
     wAtendido := StrToFloat(DMOracle.BuscaNome('SELECT QT_ATENDIDO FROM TB_PEDIDO_ITEM','COD_PEDIDO_CAB = '+DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Text));
     If wAtendido <> 0 then
        ShowMessage('Este Pedido Já foi faturado');
   End;
  If wCadastro <> '' then
  begin
    wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB','COD_CADASTRO = '+FloatToStr(dmPedido.QPedidoCod_Cadastro.Value)+ ' AND IND_SITUACAO <> '+chr(39)+'BAIXA TOTAL'+chr(39));
    if wDtvencto <> '' then
       if StrToDate(wDtVencto) < Date Then
          ShowMessage('Cliente Com Titulos Atrasados')
       Else
          ShowMessage('Cliente Com Titulos A Vencer');
    If Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+wCadastro)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!');
    If DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'ZADIMEL' then
    Begin
      wClassificacao := DMOracle.BuscaNome('SELECT COD_CLASS_CADASTRO FROM TB_CADASTRO',' COD_CADASTRO = '+wCadastro);
      If StrToInt(wClassificacao) > 2 Then
       Begin
         wDescClassificacao := DMOracle.BuscaNome('SELECT DESC_CLASSIFICACAO FROM TB_CLASS_CADASTRO','COD_CLASS_CADASTRO = '+Trim(wClassificacao));
         ShowMessage('Cliente com Classificação = '+wDescClassificacao);
       End;
    End;
  End;
end;

procedure TFEmbarqueCad.ExcluiProdutodoPedidodeUmEmbarque1Click(
  Sender: TObject);
Var wComando : String;
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[5].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QEmbarqueItensPed.Close;
    If Trim(FEmbarqueParam.Me4Embarque.Text) <> '' then
      QEmbarqueItensPed.SetVariable('COD_EMBARQUE',FEmbarqueParam.ME4Embarque.Text)
    Else
      Raise Exception.Create ('Informar Número do Embarque');
    If Trim(FEmbarqueParam.Me4Produto.Text) <> '' then
      QEmbarqueItensPed.SetVariable('COD_PRODUTO',FEmbarqueParam.Me4Produto.Text)
    Else
      Raise Exception.Create ('Informar Código Produto');
    QEmbarqueItensPed.Open;
    While not QEmbarqueItensPed.Eof Do
    Begin
      With DMOracle do
      Begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'DELETE FROM TB_PEDIDO_ITEM WHERE COD_PEDIDO_ITEM =' + QEmbarqueItensPedCod_Pedido_Item.Text;
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
        If DMOracle.DBCemapa.InTransaction then
           DMOracle.DBCemapa.Commit;
        QEmbarqueItensPed.Next;
      End;
    End;
    QEmbarqueItensPed.Close;
  End;
end;

procedure TFEmbarqueCad.RelaodeCargas1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[6].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
  with DMEmbarque do
  begin
    QREmbarqueCarga.Close;
    if (Trim(FEmbarqueParam.ME7DtInicio.Text) = '') or (Trim(FEmbarqueParam.ME7DtFim.Text) = '') then
      Raise Exception.Create('Período deve ser Informado');
    QREmbarqueCarga.SetVariable('DT_INICIAL',StrToDate(Trim(FEmbarqueParam.ME7DtInicio.Text)));
    QREmbarqueCarga.SetVariable('DT_FINAL',StrToDate(Trim(FEmbarqueParam.ME7DtFim.Text)));
    case FEmbarqueParam.RG7Situacao.ItemIndex of
      0 : QREmbarqueCarga.SetVariable('IND_SITUACAO', NULL);
      1 : QREmbarqueCarga.SetVariable('IND_SITUACAO', 'ABERTO');
      2 : QREmbarqueCarga.SetVariable('IND_SITUACAO', 'ACERTADO');
      3 : QREmbarqueCarga.SetVariable('IND_SITUACAO', 'BAIXADO');
    end;
    QREmbarqueCarga.Open;
    if FREmbarqueCarga = nil then
      FREmbarqueCarga := TFREmbarqueCarga.Create(Application);
    FREmbarqueCarga.QRLTitulo.Caption:= 'RELAÇÃO DE CARGAS NO PERÍODO DE '+FEmbarqueParam.ME7DtInicio.Text+' À '+FEmbarqueParam.ME7DtFim.Text;
    case FEmbarqueParam.RG7Situacao.ItemIndex of
      0 : FREmbarqueCarga.QRLTitulo.Caption := FREmbarqueCarga.QRLTitulo.Caption + ' TODOS';
      1 : FREmbarqueCarga.QRLTitulo.Caption := FREmbarqueCarga.QRLTitulo.Caption + ' ABERTO';
      2 : FREmbarqueCarga.QRLTitulo.Caption := FREmbarqueCarga.QRLTitulo.Caption + ' ACERTADO S/LANCTO CHEQUE';
      3 : FREmbarqueCarga.QRLTitulo.Caption := FREmbarqueCarga.QRLTitulo.Caption + ' BAIXADO TOTAL';
    end;
    if FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FREmbarqueCarga.QRPrimario.Preview
    else
      FREmbarqueCarga.QRPrimario.Print;
    QREmbarqueCarga.Close;
  end;
end;

procedure TFEmbarqueCad.BaixaEstoquePeloEmbarque1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[7].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QEmbarqueItensNota.Close;
    If Trim(FEmbarqueParam.Me7Embarque.Text) <> '' then
      QEmbarqueItensNota.SetVariable('COD_EMBARQUE',Trim(FEmbarqueParam.Me7Embarque.Text))
    Else
      Raise Exception.Create ('Informar Número do Embarque');
    QEmbarque.Close;
    QEmbarque.SetVariable('Pk',StrToInt(Trim(FEmbarqueParam.Me7Embarque.Text)));
    QEmbarque.Open;
    If QEmbarqueInd_Atualiza_Estoque.Value = 'SIM' Then
      Raise Exception.Create ('Este Embarque Já Foi Atualizado Estoque');
    QEmbarqueItensNota.Open;
    QEmbarqueItensNota.First;
    if QEmbarqueItensNota.recordCount > 0 then
    begin
      Try
        DMOracle.DBCemapa.StartTransaction;
        While not QEmbarqueItensNota.Eof Do
        Begin
          DmEstoque.Atualiza_Estoque(-1,QEmbarqueItensNotaCod_Filial.Value,QEmbarqueItensNotaCod_Produto.Value,1,
                                    (QEmbarqueItensNotaQt_Quantidade.Value*-1), 0,Date,Date);
          QEmbarqueItensNota.Next;
        End;
        QEmbarque.Edit;
        QEmbarqueInd_Atualiza_Estoque.Value := 'SIM';
        QEmbarqueDt_Atualiza_Estoque.Value := date;
        QEmbarque.Post;
        DmOracle.DBCemapa.Commit;
        QEmbarqueItensNota.Close;
      Except
        DmOracle.DBCemapa.Rollback;
        QEmbarqueItensNota.Cancel;
        Raise;
      End;
    End
    else
      raise exception.Create('Embarque não confirmado, notas fiscais não emitidas estoque não pode ser atualizado');
  End;
end;

procedure TFEmbarqueCad.RelaoTotalPorPedidos1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[8].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FEmbarqueParam.ME2Filial.Text),'VENDA');
    QREmbarquePedido.Close;
    If Trim(FEmbarqueParam.Me8Embarque.Text) <>'' Then
      QREmbarquePedido.SetVariable('EMBARQUE',Trim(FEmbarqueParam.Me8Embarque.Text))
    Else
      QREmbarquePedido.SetVariable('EMBARQUE',null);
    If Trim(FEmbarqueParam.Me8Cadastro.Text) = '' then
      QREmbarquePedido.SetVariable('COD_CADASTRO',Null)
    Else
      QREmbarquePedido.SetVariable('COD_CADASTRO',Trim(FEmbarqueParam.Me8Cadastro.Text));
    QREmbarquePedido.Open;
    If FrEmbarquePedido = Nil then
      FrEmbarquePedido := TFrEmbarquePedido.Create(Application);
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FrEmbarquePedido.QRPrimario.Preview
    Else
      FrEmbarquePedido.QRPrimario.Print;
    QREmbarquePedido.Close;
  End;

end;

procedure TFEmbarqueCad.VoltaEstoquepeloEmbarque1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[7].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QEmbarqueItensNota.Close;
    If Trim(FEmbarqueParam.Me7Embarque.Text) <> '' then
      QEmbarqueItensNota.SetVariable('COD_EMBARQUE',Trim(FEmbarqueParam.Me7Embarque.Text))
    Else
      Raise Exception.Create ('Informar Número do Embarque');
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',StrToInt(Trim(FEmbarqueParam.Me7Embarque.Text)));
    QEmbarque.Open;
    If QEmbarqueInd_Atualiza_Estoque.Value = 'NAO' Then
      Raise Exception.Create ('Não é possivel voltar estoque porque embarque nunca foi Atualizado');
    QEmbarqueItensNota.Open;
    QEmbarqueItensNota.First;
    if QEmbarqueItensNota.recordCount > 0 then
    begin
      Try
        DMOracle.DBCemapa.StartTransaction;
        While not QEmbarqueItensNota.Eof Do
        Begin
          DmEstoque.Atualiza_Estoque(-1,QEmbarqueItensNotaCod_Filial.Value,QEmbarqueItensNotaCod_Produto.Value,1,
                                    (QEmbarqueItensNotaQt_Quantidade.Value), 0,Date,Date);
          QEmbarqueItensNota.Next;
        End;
        QEmbarque.Edit;
        QEmbarqueInd_Atualiza_Estoque.Value := 'NAO';
        QEmbarqueDt_Atualiza_Estoque.Text := '';
        QEmbarque.Post;
        DmOracle.DBCemapa.Commit;
        QEmbarqueItensNota.Close;
      Except
        DmOracle.DBCemapa.Rollback;
        QEmbarqueItensNota.Cancel;
        Raise;
      End;
    End
    else
      raise exception.Create('Estoque não pode ser atualizado, verifique situação das notas');
  End;
end;

procedure TFEmbarqueCad.RelaoBaixadoporData1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[9].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QREmbarqueBaixado.Close;
    If Trim(FEmbarqueParam.Me9Embarque.Text) <>'' Then
      QREmbarqueBaixado.SetVariable('EMBARQUE',Trim(FEmbarqueParam.Me9Embarque.Text))
    Else
      QREmbarqueBaixado.SetVariable('EMBARQUE',null);
    If (FEmbarqueParam.Me9DtInicial.Text = '') or (FEmbarqueParam.Me9DtFinal.Text = '')  Then
      Raise Exception.create('É Preciso informar a data')
    else
      QREmbarqueBaixado.SetVariable('DT_INICIAL',trim(FEmbarqueParam.ME9DtInicial.Text));
      QREmbarqueBaixado.SetVariable('DT_FINAL',trim(FEmbarqueParam.ME9DtFinal.Text));
      
    QREmbarqueBaixado.Open;
    If FrEmbarqueBaixado = Nil then
      FrEmbarqueBaixado := TFrEmbarqueBaixado.Create(Application);
      FREmbarqueBaixado.QRLPeriodo.Caption:='Período:'+ FEmbarqueParam.ME9DtInicial.Text+ ' até ' +FEmbarqueParam.ME9DtFinal.Text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FrEmbarqueBaixado.QRPrimario.Preview
    Else
      FrEmbarqueBaixado.QRPrimario.Print;
    QREmbarqueBaixado.Close;
  End;

end;

procedure TFEmbarqueCad.RelProdutosEmbarcados1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[10].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QRProdutoEmbarcado.Close;
    If Trim(FEmbarqueParam.Me9Classe.Text) <>'' Then
      QRProdutoEmbarcado.SetVariable('COD_CLASSE',Trim(FEmbarqueParam.Me9Classe.Text))
    Else
      QRProdutoEmbarcado.SetVariable('COD_CLASSE',null);
    If (FEmbarqueParam.Me9Data_I.Text = '') or (FEmbarqueParam.Me9Data_F.Text = '')  Then
      Raise Exception.create('É Preciso informar um período')
    else
      QRProdutoEmbarcado.SetVariable('DATA_I',trim(FEmbarqueParam.Me9Data_I.Text));
      QRProdutoEmbarcado.SetVariable('DATA_F',trim(FEmbarqueParam.Me9Data_F.Text));

    QRProdutoEmbarcado.Open;
    If FRProdutoEmbarcado = Nil then
      FRProdutoEmbarcado := TFRProdutoEmbarcado.Create(Application);
      FRProdutoEmbarcado.QRLPeriodo.Caption:='Período:'+ trim(FEmbarqueParam.Me9Data_I.Text)+ ' até ' +trim(FEmbarqueParam.Me9Data_F.Text);
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FRProdutoEmbarcado.QRPrimario.Preview
    Else
      FRProdutoEmbarcado.QRPrimario.Print;
    QRProdutoEmbarcado.Close;
  End;
end;

procedure TFEmbarqueCad.EmbarqueNotaFiscaltxt1Click(Sender: TObject);
begin
  inherited;
    If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[0].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FEmbarqueParam.MeFilial.Text),'VENDA');
    QREmbarque_Ped_Nf.Close;

    If Trim(FEmbarqueParam.MEEmbarque.Text) = '' then
     Begin
      QREmbarque_Ped_Nf.SetVariable('EMBARQUE',Null)
     end
    Else
      QREmbarque_Ped_Nf.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
    

    If Trim(FEmbarqueParam.ME0Vendedor.Text) = '' then
     Begin
      QREmbarque_Ped_Nf.SetVariable('COD_VENDEDOR',Null)
     End
    Else
     Begin
      QREmbarque_Ped_Nf.SetVariable('COD_VENDEDOR',FEmbarqueParam.ME0Vendedor.Text);
     End;

     If (FEmbarqueParam.Me0DtInicial.Text = '') or (FEmbarqueParam.Me0DtFinal.Text = '')  Then
      Raise Exception.create('É Preciso informar um período')
    else
      QREmbarque_Ped_Nf.SetVariable('DT_INICIAL',trim(FEmbarqueParam.Me0DtInicial.Text));
      QREmbarque_Ped_Nf.SetVariable('DT_FINAL',trim(FEmbarqueParam.Me0DtFinal.Text));
      
    Case FEmbarqueParam.Rg0Operacao.ItemIndex Of
     0 :
      Begin
        QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL','S');
      End;
     1 :
      Begin
        QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL','N');
      End;
     2 :
      Begin
        QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL',Null);
      End;

    End;
    QREmbarque_Ped_Nf.Open;
    If FrEmbarque_Ped_Nf = Nil then
      FrEmbarque_Ped_Nf := TFrEmbarque_Ped_Nf.Create(Application);
    FREmbarque_Ped_Nf.QRLTitulo.Caption := 'Relacao Notas Para Embarque Nr. '+FEmbarqueParam.MEEmbarque.text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FREmbarque_Ped_Nf.QRPrimario.Preview
    Else
      FrEmbarque_Ped_Nf.QRPrimario.Print;
    QREmbarque_Ped_Nf.Close;

  End;


end;

end.

